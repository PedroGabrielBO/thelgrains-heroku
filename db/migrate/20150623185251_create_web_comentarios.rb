class CreateWebComentarios < ActiveRecord::Migration
  def change
    create_table :web_comentarios do |t|
      t.string :nome
      t.string :email, null: false
      t.text :comentario
      t.index :email

      t.timestamps null: false
    end
  end
end
