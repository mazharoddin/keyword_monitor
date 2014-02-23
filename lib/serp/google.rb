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

      craw_result = crawl
      logger.info "result: #{craw_result}"
      craw_result
    end

  private

    # Possible results:
    # [Integer (position), URL]
    # 'blocked'
    # 'missing keyword'
    def crawl
      PAGE_LIMIT.times do |page_index|
        @page_number = page_index + 1

        MAX_ATTEMPTS_PER_PAGE.times do |attempt|
          @attempt = attempt

          logger.info "Visiting page #{@page_number} at attempt #{@attempt}"
          timer REQUEST_INTERVAL
          visit "/search?q=#{URI.encode(@keyword)}&start=#{page_index * 10}"

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
              last_attempt? ? (return :blocked) : next
            else
              logger.unknown "The result elements was not found"
              next
            end
          end
        end

        # Return position if keyword was found
        if idx = keyword_page_index
          # take_screenshot
          return [:found, idx + 1, @results[idx]]
        end
      end

      :missing
    end

    def keyword_page_index
      @results.index { |e| e =~ /#{@url}/ }
    end

    def page_results
      all('#search cite').map { |item| item.text }
    end

    def blocked?
      page.html.match /Para continuar, digite os caracteres abaixo/
    end

    def last_attempt?
      MAX_ATTEMPTS_PER_PAGE == (@attempt + 1)
    end

    def take_screenshot
      path     = "#{Rails.root}/public/screenshots"
      filename = "#{@keyword.gsub(' ', '_')}_page#{@page_number}_attempt#{@attempt}.png"

      page.save_screenshot File.join(path, filename)
    end
  end
end
