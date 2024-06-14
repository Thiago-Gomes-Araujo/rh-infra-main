class ChangeTypeFloatToDecimal < ActiveRecord::Migration[7.0]
  def up
    change_column :g_indices_socioeconomicos, :indice, :decimal, precision: 17, scale: 2

    # Mudando o tipo dos campos na tabela 'g_taxas_aprovacoes'
    change_column :g_taxas_aprovacoes, :serie_1, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_2, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_3, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_4, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :serie_5, :decimal, precision: 17, scale: 2
    change_column :g_taxas_aprovacoes, :total, :decimal, precision: 17, scale: 2
    change_column :g_indices_socioeconomicos, :indice, :decimal, precision: 17, scale: 2
  end

  def down
    change_column :g_indices_socioeconomicos, :indice, :float

    # Mudando o tipo dos campos na tabela 'g_taxas_aprovacoes' de volta para float
    change_column :g_taxas_aprovacoes, :serie_1, :float
    change_column :g_taxas_aprovacoes, :serie_2, :float
    change_column :g_taxas_aprovacoes, :serie_3, :float
    change_column :g_taxas_aprovacoes, :serie_4, :float
    change_column :g_taxas_aprovacoes, :serie_5, :float
    change_column :g_taxas_aprovacoes, :total, :float
    change_column :g_indices_socioeconomicos, :indice, :float
  end
end
