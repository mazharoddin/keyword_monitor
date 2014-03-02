json.array! collection do |keyword|
  json.id keyword.id
  json.name keyword.name
  json.crawl_results keyword.crawl_results, :status, :position, :url, :created_at
end
