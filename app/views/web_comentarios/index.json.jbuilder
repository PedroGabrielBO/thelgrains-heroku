json.array!(@web_comentarios) do |web_comentario|
  json.extract! web_comentario, :id
  json.url web_comentario_url(web_comentario, format: :json)
end
