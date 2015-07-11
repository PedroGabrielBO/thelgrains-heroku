class Cliente < ActiveRecord::Base
  has_many :agendamentos
  has_many :atendimentos

  validates_presence_of :nome, :telefone

  validates_uniqueness_of :cpf, :email, allow_nil: true

  validates_length_of :cpf, is: 11, allow_nil: true
  validates_length_of :telefone, is: 10
  validates_length_of :celular, in: 10..11, allow_nil: true

  validates_format_of :email, with: /.+@.+\..+/i
  validates_numericality_of :cpf, :celular, :telefone

end
