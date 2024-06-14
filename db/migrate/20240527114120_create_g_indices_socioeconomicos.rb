class CreateGIndicesSocioeconomicos < ActiveRecord::Migration[7.0]
  def change
    create_table :g_indices_socioeconomicos do |t|
      t.float :indice
      t.references :g_municipio, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
