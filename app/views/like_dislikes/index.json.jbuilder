json.array!(@like_dislikes) do |like_dislike|
  json.extract! like_dislike, :id, :likes
  json.url like_dislike_url(like_dislike, format: :json)
end
