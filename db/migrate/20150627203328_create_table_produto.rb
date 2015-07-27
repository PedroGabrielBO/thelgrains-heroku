class CreateTableProduto < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :valor

      t.timestamps null: false
    end
  end
end
