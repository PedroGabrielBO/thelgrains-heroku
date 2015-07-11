class CreateTableProduto < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome, null: false
      t.float :valor, default: 0.0

      t.timestamps null: false
    end
  end
end
