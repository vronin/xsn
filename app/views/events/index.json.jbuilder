json.array!(@events) do |event|
  json.extract! event, :location, :idea_id
  json.url event_url(event, format: :json)
end
