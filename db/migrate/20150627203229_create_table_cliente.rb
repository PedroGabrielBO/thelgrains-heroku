class CreateTableCliente < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :telefone
      t.string :celular
      t.string :email, index: true
      t.string :cpf, index: { unique: true }, null: false

      t.timestamps null: false
    end
  end
end
