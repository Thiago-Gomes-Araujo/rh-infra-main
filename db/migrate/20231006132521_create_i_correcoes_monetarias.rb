class CreateICorrecoesMonetarias < ActiveRecord::Migration[7.0]
  def change
    create_table :i_correcoes_monetarias do |t|
      t.date :data_avaliacao
      t.decimal :valor_edificacao
      t.decimal :valor_terreno
      t.date :competencia_avaliacao
      t.integer :meses
      t.integer :vida_util_anos
      t.integer :vida_util_meses
      t.string :percentual_residual
      t.decimal :valor_residual
      t.decimal :valor_depreciavel
      t.decimal :depreciacao_mes
      t.decimal :depreciacao_acumulada
      t.decimal :valor_contabil
      t.decimal :benfeitoria
      t.date :data_benfeitoria
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
