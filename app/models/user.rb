class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, authentication_keys: [:cpf]

  has_one :funcionario, inverse_of: :user
  has_many :atendimentos

  has_many :ajudantes, dependent: :destroy

  validates :cpf, presence: true, numericality: true, uniqueness: true, length: { is: 11 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_associated :funcionario

  accepts_nested_attributes_for :funcionario, allow_destroy: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
