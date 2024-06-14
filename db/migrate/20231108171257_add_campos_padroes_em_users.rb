class AddCamposPadroesEmUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :created_by, :string
    add_column :users, :updated_by, :string
  end

  def down
    remove_column :users, :created_by, :string
    remove_column :users, :updated_by, :string
  end
end
