json.array!(@posts) do |post|
  json.extract! post, :titulo, :contenido, :extension
  json.url post_url(post, format: :json)
end
