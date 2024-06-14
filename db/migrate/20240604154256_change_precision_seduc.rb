class ChangePrecisionSeduc < ActiveRecord::Migration[7.0]
  def up
    change_column :g_indices_socioeconomicos, :indice, :decimal, precision: 17, scale: 4
    change_column :g_saero_municipios, :indice_lp_segundo_ano, :decimal, precision: 17, scale: 4
    change_column :g_saero_municipios, :indice_mt_segundo_ano, :decimal, precision: 17, scale: 4
    change_column :g_saero_municipios, :indice_lp_quinto_ano, :decimal, precision: 17, scale: 4
    change_column :g_saero_municipios, :indice_mt_quinto_ano, :decimal, precision: 17, scale: 4
    change_column :g_saero_municipios, :iqa, :decimal, precision: 17, scale: 4
    change_column :g_saero_municipios, :iqf, :decimal, precision: 17, scale: 4
    change_column :g_taxas_aprovacoes, :serie_1, :decimal, precision: 17, scale: 4
    change_column :g_taxas_aprovacoes, :serie_2, :decimal, precision: 17, scale: 4
    change_column :g_taxas_aprovacoes, :serie_3, :decimal, precision: 17, scale: 4
    change_column :g_taxas_aprovacoes, :serie_4, :decimal, precision: 17, scale: 4
    change_column :g_taxas_aprovacoes, :serie_5, :decimal, precision: 17, scale: 4
  end

  def down
    change_column :g_indices_socioeconomicos, :indice, :decimal, precision: 17, scale: 2
    change_column :g_saero_municipios, :indice_lp_segundo_ano, :decimal, precision: 17, scale: 2
    change_column :g_saero_municipios, :indice_mt_segundo_ano, :decimal, precision: 17, scale: 2
    change_column :g_saero_municipios, :indice_lp_quinto_ano, :decimal, precision: 17, scale: 2
    change_column :g_saero_municipios, :indice_mt_quinto_ano, :decimal, precision: 17, scale: 2
    change_column :g_saero_municipios, :iqa, :decimal, precision: 17, scale: 2
    change_column :g_saero_municipios, :iqf, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_1, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_2, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_3, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_4, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_5, :decimal, precision: 17, scale: 2
  end
end
