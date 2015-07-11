json.array!(@servicos) do |servico|
  json.extract! servico, :id, :nome, :valor, :taxa_principal, :taxa_ajudante
  json.url servico_url(servico, format: :json)
end
