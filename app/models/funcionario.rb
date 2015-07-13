class Funcionario < ActiveRecord::Base
  belongs_to :user, inverse_of: :funcionario

  validates_presence_of :user, :nome, :telefone, :celular, :endereco, :cep
  validates_length_of :cep, is: 8
  validates_length_of :telefone, is: 10
  validates_length_of :celular, in: 10..11
  validates_length_of :endereco, minimum: 10
  validates_numericality_of :telefone, :celular, :cep


end
