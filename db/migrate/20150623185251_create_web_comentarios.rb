class CreateWebComentarios < ActiveRecord::Migration
  def change
    create_table :web_comentarios do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.text :comentario, null: false
      t.index :email

      t.timestamps null: false
    end
  end
end
