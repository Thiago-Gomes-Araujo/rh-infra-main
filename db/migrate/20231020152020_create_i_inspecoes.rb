class CreateIInspecoes < ActiveRecord::Migration[7.0]
  def change
    create_table :i_inspecoes do |t|
      t.string :descricao
      t.references :i_predio, null: false, foreign_key: true
      t.references :i_tipo_inspecao, null: false, foreign_key: true
      t.date :data_inspecao
      t.date :data_correcao
      t.string :processo_sei
      t.string :observacao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
