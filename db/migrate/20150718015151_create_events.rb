class CreateEvents < ActiveRecord::Migration
  def up
    change_table :agendamentos do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :all_day
      t.remove :data
      t.remove :servico
    end
  end
  def down
    change_table :agendamentos do |t|
      t.remove :title
      t.remove :description
      t.remove :start
      t.remove :end
      t.remove :all_day
      t.datetime :data
      t.text :servico
    end
  end
end
