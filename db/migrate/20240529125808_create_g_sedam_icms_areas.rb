class CreateGSedamIcmsAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :g_sedam_icms_areas do |t|
      t.references :g_municipio, null: false, foreign_key: true
      t.decimal :area_protegida
      t.decimal :area_antropizada
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
