# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

f = Funcionario.create(nome: 'Funcionario1', cep: '00000000',
                       endereco: 'Rua Pedro Vicente, 133, apto 130',
                       telefone_fixo: '00000000',
                       cpf: '77777777777')
f.user = User.create(cpf: '77777777777', password: 'funcionario1', admin: false)
f.save!

f2 = Funcionario.create(nome: 'Funcionario2', cep: '00000000',
                        endereco: 'Rua Pedro Vicente, 133, apto 100',
                        telefone_fixo: '00000000',
                        cpf: '88888888888')
f2.user = User.create(cpf: '88888888888', password: 'funcionario2', admin: true)
f2.save!

c = Cliente.create(nome: 'Cliente1', telefone: '00000000')
s = Servico.create(nome: 'Corte de Cabelo', valor: 10.0, taxa_principal: 20.0)
ag = Agendamento.new(funcionario_id: f, servico: "Corte de Cabelo Médio",
                     data: Date.tomorow)
ag2 = f2.agendamento.new(servico: "Corte Zika", data: Date.current)
ag.save!
ag2.save!
at1 = Atendimento.create(funcio)
