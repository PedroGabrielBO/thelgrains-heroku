require 'time'
class Agendamento < ActiveRecord::Base
  belongs_to :user
  belongs_to :cliente

  validates_presence_of :user
  validates_associated :user, :cliente
  validate :start_not_before_now

  # state_machine initial: :aberto do
  # end

  private

  def start_not_before_now
    return true if start > DateTime.now
    errors.add(:start, 'a data/hora deve ser depois da data/hora atual')
  end
end
