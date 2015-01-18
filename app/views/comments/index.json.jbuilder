json.array!(@comments) do |comment|
  json.extract! comment, :id, :message, :submission_id, :parent_id
  json.url comment_url(comment, format: :json)
end
