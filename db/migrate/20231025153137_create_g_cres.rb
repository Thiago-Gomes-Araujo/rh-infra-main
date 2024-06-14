class CreateGCres < ActiveRecord::Migration[7.0]
  def change
    create_table :g_cres do |t|
      t.string :descricao
      t.references :g_municipio, null: false, foreign_key: true
      t.references :g_tipologia_cre, null: false, foreign_key: true
      t.boolean :nucleo_apoio
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
