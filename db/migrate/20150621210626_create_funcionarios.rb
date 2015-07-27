class CreateFuncionarios < ActiveRecord::Migration
  def up
    create_table :funcionarios do |t|
      t.references :user, index: true, null: false
      t.string :nome
      t.string :telefone
      t.string :celular
      t.string :endereco
      t.string :cep, limit: 8

      t.timestamps null: false
    end
    add_foreign_key :funcionarios, :users
  end

  def down
    drop_table :funcionarios
  end
end
