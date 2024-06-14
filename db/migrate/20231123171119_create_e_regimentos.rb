class CreateERegimentos < ActiveRecord::Migration[7.0]
  def change
    create_table :e_regimentos do |t|
      t.references :i_predio, null: false, foreign_key: true
      t.boolean :homologacao
      t.integer :numero_homologacao
      t.string :portaria
      t.date :data_portaria
      t.string :numero_doe
      t.date :data_doe
      t.string :url_doe
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
