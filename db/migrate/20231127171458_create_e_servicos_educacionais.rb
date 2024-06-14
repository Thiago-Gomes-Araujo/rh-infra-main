class CreateEServicosEducacionais < ActiveRecord::Migration[7.0]
  def change
    create_table :e_servicos_educacionais do |t|
      t.string :nome
      t.references :e_ato_normativo, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
