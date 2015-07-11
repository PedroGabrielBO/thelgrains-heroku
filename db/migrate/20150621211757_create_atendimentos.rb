class CreateAtendimentos < ActiveRecord::Migration
  def up
    create_table :atendimentos do |t|
      t.references :servico, index: true, null: false
      t.references :user, index: true, null: false
      t.references :cliente, index: true
      t.float :gasto_add, default: 0.0
      t.string :state
      
      t.timestamps null: false
    end
    add_foreign_key :atendimentos, :servicos
    add_foreign_key :atendimentos, :user
    add_foreign_key :atendimentos, :clientes
  end

  def down
    drop_table :atendimentos
  end
end
