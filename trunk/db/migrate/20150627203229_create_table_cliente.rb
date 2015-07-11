class CreateTableCliente < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :telefone, null: false
      t.string :celular
      t.string :email, index: true
      t.string :cpf, index: { unique: true }

      t.timestamps null: false
    end
  end
end
