class CreateServicos < ActiveRecord::Migration
  def up
    create_table :servicos do |t|
      t.references :categoria_servico, index: true, null: false
      t.string :nome, null: false
      t.float :valor, default: 0.0
      t.float :taxa_principal, default: 0.0
      t.float :taxa_secundaria, default: 0.0

      t.timestamps null: false
    end
    add_foreign_key :servicos, :categoria_servicos
  end

  def down
    drop_table :servicos
  end
end
