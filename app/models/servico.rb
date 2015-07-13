class Servico < ActiveRecord::Base
  belongs_to :categoria_servico, inverse_of: :servicos

  validates_presence_of :nome, :categoria_servico, :valor, :taxa_principal
  validates_associated :categoria_servico
  validates :valor, :taxa_principal, :taxa_secundaria, numericality: true

end
