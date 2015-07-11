class Atendimento < ActiveRecord::Base
  belongs_to :servico
  belongs_to :user
  belongs_to :cliente

  has_many :ajudantes, dependent: :destroy
  has_many :users, through: :ajudantes

  validates_associated :user, :cliente, :servico
  validates_numericality_of :gasto_add, allow_nil: true

  state_machine initial: :aberto do
  end

end
