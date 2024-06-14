class AddNewAtributtesToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :cpf, :string
    add_column :users, :admin, :boolean
    add_reference :users, :g_filial, foreign_key: true
  end

  def down
    remove_column :users, :cpf, :string
    remove_column :users, :admin, :boolean
    remove_reference :users, :g_filial, foreign_key: true
  end
end
