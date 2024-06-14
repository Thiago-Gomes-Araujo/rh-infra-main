class AddAnoToGSaeroMunicipios < ActiveRecord::Migration[7.0]
  def up
    add_column :g_saero_municipios, :ano, :integer
  end

  def down
    remove_column :g_saero_municipios, :ano, :integer
  end
end
