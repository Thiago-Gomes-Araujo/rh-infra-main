class CreateEAtosNormativos < ActiveRecord::Migration[7.0]
  def change
    create_table :e_atos_normativos do |t|
      t.string :parecer
      t.string :numero_doe
      t.date :data_doe
      t.string :url_doe
      t.string :descricao
      t.references :i_predio, null: false, foreign_key: true
      t.references :e_tipo_ato_normativo, null: false, foreign_key: true
      t.references :e_normatizacao, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
