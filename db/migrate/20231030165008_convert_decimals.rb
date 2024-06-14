class ConvertDecimals < ActiveRecord::Migration[7.0]
  def up
    change_column :i_predios, :valor_original, :decimal, precision: 17, scale: 2
    change_column :i_predios, :valor_reavaliado, :decimal, precision: 17, scale: 2
    change_column :i_predios, :valor_terreno, :decimal, precision: 17, scale: 2
    change_column :i_predios, :valor_edificacao_infraobras, :decimal, precision: 17, scale: 2

    change_column :i_contratos, :valor, :decimal, precision: 17, scale: 2
    change_column :i_contratos, :valor_aditivo, :decimal, precision: 17, scale: 2

    change_column :i_correcoes_monetarias, :valor_edificacao, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :valor_terreno, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :valor_residual, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :valor_depreciavel, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :depreciacao_mes, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :depreciacao_acumulada, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :valor_contabil, :decimal, precision: 17, scale: 2
    change_column :i_correcoes_monetarias, :benfeitoria, :decimal, precision: 17, scale: 2
  end
end
