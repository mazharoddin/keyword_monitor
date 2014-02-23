class RetrievePositionsJob
  include SuckerPunch::Job

  def perform project=nil, keyword=nil
    @serp = SerpChecker::Google.new

    @keywords =
      case
      when keyword.present? then [keyword]
      when project.present? then project.keywords.all
      else
        Keyword.all
      end

    @keywords.each do |keyword|
      keyword.craw_results << build_craw_result(@serp.get_position(keyword.name, keyword.project.url))
    end
  end

private

  def build_craw_result result
    if result.is_a? Array
      CrawResult.new status: result[0], position: result[1], url: result[2]
    else
      CrawResult.new status: result
    end
  end
end
