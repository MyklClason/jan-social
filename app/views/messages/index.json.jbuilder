json.array!(@messages) do |message|
  json.extract! message, :id, :creator, :content
  json.url message_url(message, format: :json)
end
