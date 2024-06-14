class AddPortariaToEAtosNormativos < ActiveRecord::Migration[7.0]
  def up
    add_column :e_atos_normativos, :portaria, :string
    add_column :e_atos_normativos, :observacao, :string
    rename_column :e_atos_normativos, :url_doe, :link_doe
  end

  def down
    remove_column :e_atos_normativos, :portaria, :string
    remove_column :e_atos_normativos, :observacao, :string
    rename_column :e_atos_normativos, :link_doe, :url_doe
  end
end
