class CreateCategoriaServicos < ActiveRecord::Migration
  def up
    create_table :categoria_servicos do |t|
      t.string :nome, null: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :categoria_servicos
  end
end
