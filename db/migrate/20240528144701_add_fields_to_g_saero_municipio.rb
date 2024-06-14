class AddFieldsToGSaeroMunicipio < ActiveRecord::Migration[7.0]
  def up
    rename_column :g_saero_municipios, :indice_lp, :indice_lp_segundo_ano
    rename_column :g_saero_municipios, :indice_mt, :indice_mt_segundo_ano
    add_column :g_saero_municipios, :indice_lp_quinto_ano, :decimal, precision: 17, scale: 2
    add_column :g_saero_municipios, :indice_mt_quinto_ano, :decimal, precision: 17, scale: 2
    add_column :g_saero_municipios, :iqa, :decimal, precision: 17, scale: 2
    add_column :g_saero_municipios, :iqf, :decimal, precision: 17, scale: 2
  end

  def down
    rename_column :g_saero_municipios, :indice_lp_segundo_ano, :indice_lp
    rename_column :g_saero_municipios, :indice_mt_segundo_ano, :indice_mt
    remove_column :g_saero_municipios, :indice_lp_quinto_ano, :decimal, precision: 17, scale: 2
    remove_column :g_saero_municipios, :indice_mt_quinto_ano, :decimal, precision: 17, scale: 2
    remove_column :g_saero_municipios, :iqa, :decimal, precision: 17, scale: 2
    remove_column :g_saero_municipios, :iqf, :decimal, precision: 17, scale: 2
  end
end
