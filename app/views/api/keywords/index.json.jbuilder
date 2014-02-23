json.array! collection do |keyword|
  json.id keyword.id
  json.name keyword.name
  json.craw_results keyword.craw_results, :status, :position, :url, :created_at
end
