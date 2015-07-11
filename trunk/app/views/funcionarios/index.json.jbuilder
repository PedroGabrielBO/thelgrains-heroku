json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :cpf, :telefone_fixo, :celular_1, :celular_2, :email, :endereco, :endereco_numero, :cep, :endereco_complemento, :password_digest, :telefone_ramal, :nome
  json.url funcionario_url(funcionario, format: :json)
end
