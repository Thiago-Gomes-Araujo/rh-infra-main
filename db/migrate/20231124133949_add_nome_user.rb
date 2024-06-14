class AddNomeUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :nome, :string
  end

  def down
    remove_column :users, :nome, :string
  end
end
