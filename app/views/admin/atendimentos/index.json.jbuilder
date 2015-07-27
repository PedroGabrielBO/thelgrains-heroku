json.array!(@admin_atendimentos) do |admin_atendimento|
  json.extract! admin_atendimento, :id
  json.url admin_atendimento_url(admin_atendimento, format: :json)
end
