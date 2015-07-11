class User < ActiveRecord::Base
  devise :database_authenticatable

  has_one :funcionario, inverse_of: :user
  has_many :atendimentos

  has_many :ajudantes, dependent: :destroy

  validates :cpf, presence: true, numericality: true, uniqueness: true, length: { is: 11 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_associated :funcionario

end
