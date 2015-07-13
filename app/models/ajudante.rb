class Ajudante < ActiveRecord::Base
  belongs_to :atendimento
  belongs_to :user
end
