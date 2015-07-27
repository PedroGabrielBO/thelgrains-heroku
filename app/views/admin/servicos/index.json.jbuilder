json.array!(@admin_servicos) do |admin_servico|
  json.extract! admin_servico, :id
  json.url admin_servico_url(admin_servico, format: :json)
end
