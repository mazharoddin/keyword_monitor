class RetrievePositionsJob
  include SuckerPunch::Job

  def perform project=nil, keyword=nil
    ActiveRecord::Base.connection_pool.with_connection do
      @serp = SerpChecker::Google.new

      @keywords =
        case
        when keyword.present? then [keyword]
        when project.present? then project.keywords.all
        else
          Keyword.all
        end

      @keywords.each do |keyword|
        puts "Crawling #{keyword}..."
        keyword.crawl_results << build_crawl_result(@serp.get_position(keyword.name, keyword.project.url))
      end
    end
  end

private

  def build_crawl_result result
    if result.is_a? Array
      CrawlResult.new status: result[0], position: result[1], url: result[2]
    else
      CrawlResult.new status: result
    end
  end
end
