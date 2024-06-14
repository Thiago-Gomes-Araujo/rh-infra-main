class CreateGIderos < ActiveRecord::Migration[7.0]
  def change
    create_table :g_ideros do |t|
      t.references :g_municipio, null: false, foreign_key: true
      t.decimal :iqa
      t.decimal :iqf
      t.references :g_taxa_aprovacao, null: false, foreign_key: true
      t.references :g_indice_socioeconomico, null: false, foreign_key: true
      t.references :g_saero_municipio, null: false, foreign_key: true
      t.decimal :idero
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
