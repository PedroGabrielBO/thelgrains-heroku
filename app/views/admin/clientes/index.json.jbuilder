json.array!(@admin_clientes) do |admin_cliente|
  json.extract! admin_cliente, :id
  json.url admin_cliente_url(admin_cliente, format: :json)
end
