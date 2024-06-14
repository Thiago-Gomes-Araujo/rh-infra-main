class CreateGTaxasAprovacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :g_taxas_aprovacoes do |t|
      t.float :serie_1
      t.float :serie_2
      t.float :serie_3
      t.float :serie_4
      t.float :serie_5
      t.float :total
      t.integer :ano
      t.references :g_municipio, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
