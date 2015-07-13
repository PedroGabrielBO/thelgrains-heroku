class CreateAgendamentos < ActiveRecord::Migration
  def up
    create_table :agendamentos do |t|
      t.references :user, index: true, null: false
      t.references :cliente, index: true
      t.text :servico, null: false
      t.datetime :data, null: false
      t.string :state
      
      t.timestamps null: false
    end
    add_foreign_key :agendamentos, :users
    add_foreign_key :agendamentos, :clientes
  end

  def down
    drop_table :agendamentos
  end
end
