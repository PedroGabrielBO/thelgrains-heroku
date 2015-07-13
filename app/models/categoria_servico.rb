class CategoriaServico < ActiveRecord::Base
  has_many :servicos, inverse_of: :categoria_servico
  validates_presence_of :nome

end
