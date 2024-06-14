class ChangeEmailToCpfAuthentication < ActiveRecord::Migration[7.0]
  def up
    add_index :users, :cpf, unique: true
  end

  def down
    remove_index :users, :cpf, unique: true
  end
end
