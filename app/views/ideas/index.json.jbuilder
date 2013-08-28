json.array!(@ideas) do |idea|
  json.extract! idea, :title, :descrption
  json.url idea_url(idea, format: :json)
end
