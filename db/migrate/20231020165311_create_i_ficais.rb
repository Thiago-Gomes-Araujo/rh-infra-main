class CreateIFicais < ActiveRecord::Migration[7.0]
  def change
    create_table :i_ficais do |t|
      t.string :descricao
      t.string :area_atuacao
      t.references :i_contrato, null: false, foreign_key: true
      t.references :i_portaria, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
