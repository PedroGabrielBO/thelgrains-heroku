json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :quantidade, :valor_venda, :valor_compra
  json.url produto_url(produto, format: :json)
end
