json.array!(@admin_funcionarios) do |admin_funcionario|
  json.extract! admin_funcionario, :id
  json.url admin_funcionario_url(admin_funcionario, format: :json)
end
