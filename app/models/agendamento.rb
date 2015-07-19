class Agendamento < ActiveRecord::Base
  belongs_to :user
  belongs_to :cliente

  validates_presence_of :servico, :data
  validates_associated :user, :cliente
  validates :servico, length: { minimum: 10 }
  validate :date_not_before_now

  state_machine initial: :aberto do
  end

  private

  def date_not_before_now
    errors.add(:data, 'a data/hora deve ser depois da data/hora atual') if data < DateTime.now
  end
end
