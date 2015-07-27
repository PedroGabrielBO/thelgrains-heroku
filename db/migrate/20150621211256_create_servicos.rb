class CreateServicos < ActiveRecord::Migration
  def up
    create_table :servicos do |t|
      t.references :categoria_servico, index: true, null: false
      t.string :nome
      t.float :valor
      t.float :taxa_principal
      t.float :taxa_secundaria

      t.timestamps null: false
    end
    add_foreign_key :servicos, :categoria_servicos
  end

  def down
    drop_table :servicos
  end
end
