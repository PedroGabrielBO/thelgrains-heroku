class Produto < ActiveRecord::Base
  validates_presence_of :nome, :valor
  validates_numericality_of :valor,  greater_than: 0
end
