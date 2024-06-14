class ChageDataTypesIbgeAndInep < ActiveRecord::Migration[7.0]
  def up
    change_column :g_distritos, :codigo_ibge, :string
    change_column :g_municipios, :codigo_ibge, :string
  end

  def down
    change_column :g_distritos, :codigo_ibge, :integer
    change_column :g_municipios, :codigo_ibge, :integer
  end
end
