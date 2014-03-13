module SerpChecker
  class Google < Base
    HOST = "http://www.google.com.br/"

    def initialize
      super host: HOST
    end

    def get_position keyword, url
      logger.info "Getting \"#{keyword}\" position..."
      @keyword = keyword
      @url     = url
      @results = []

      crawl_result = crawl
      logger.info "result: #{crawl_result}"
      crawl_result
    end

  private

    # Possible results:
    # [Integer (position), URL]
    # 'blocked'
    # 'missing keyword'
    def crawl
      MAX_ATTEMPTS_PER_PAGE.times do |attempt|
        @attempt = attempt + 1

        logger.info "Attempt #{@attempt}"
        timer
        visit "/search?q=#{URI.encode(@keyword)}&num=100"

        begin
          if page_results.any?
            @results << page_results
            @results.flatten!
            break
          else
            raise
          end
        rescue
          if blocked?
            logger.warn "BLOCKED :("
            if last_attempt?
              return :blocked
            else
              timer({blocked: true})
              next
            end
          else
            logger.unknown "The result elements was not found"
            next
          end
        end
      end

      # Return position if keyword was found
      if idx = keyword_page_index
        return [:found, idx + 1, @results[idx]]
      end

      :missing
    end

    def keyword_page_index
      @results.index { |e| e =~ /#{@url}/ }
    end

    def page_results
      all('#search h3 > a').map { |item| item['href'] }
    end

    def blocked?
      page.html.match /Para continuar, digite os caracteres abaixo/
    end

    def last_attempt?
      MAX_ATTEMPTS_PER_PAGE == @attempt
    end

    def take_screenshot
      path     = "#{Rails.root}/public/screenshots"
      filename = "#{@keyword.gsub(' ', '_')}_page#{@page_number}_attempt#{@attempt}.png"

      page.save_screenshot File.join(path, filename)
    end
  end
end
