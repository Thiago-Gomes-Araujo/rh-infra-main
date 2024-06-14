class CreateGSaeroMunicipios < ActiveRecord::Migration[7.0]
  def change
    create_table :g_saero_municipios do |t|
      t.references :g_municipio, null: false, foreign_key: true
      t.references :g_etapa_saero, null: false, foreign_key: true
      t.decimal :indice_lp
      t.decimal :indice_mt
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
