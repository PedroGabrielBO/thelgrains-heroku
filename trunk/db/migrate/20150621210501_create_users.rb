class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :cpf, null: false, limit: 11
      t.string :encrypted_password, null: false
      t.boolean :admin, default: false

      t.index :cpf, unique: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
