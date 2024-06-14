class AddCollumnPasswordConfirmationToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :password_change_required, :boolean, default: false unless column_exists?(:users, :password_change_required)
  end

  def down
    remove_column :users, :password_change_required, :boolean, default: false if column_exists?(:users, :password_change_required)
  end
end
