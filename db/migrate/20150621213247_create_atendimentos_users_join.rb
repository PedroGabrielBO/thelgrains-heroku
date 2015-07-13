class CreateAtendimentosUsersJoin < ActiveRecord::Migration
  def up
    create_join_table :atendimentos, :users, table_name: :ajudantes
  end
  def down
    drop_table :ajudantes
  end
end
