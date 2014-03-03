json.array! collection do |keyword|
  json.id keyword.id
  json.name keyword.name
  json.crawl_results keyword.crawl_results.order('created_at desc'),
    :status, :position, :url, :created_at
end
