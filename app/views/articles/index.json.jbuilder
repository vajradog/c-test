json.array!(@articles) do |article|
  json.extract! article, :id, :name, :content, :ancestry
  json.url article_url(article, format: :json)
end
