class CreateEServEducSubetapas < ActiveRecord::Migration[7.0]
  def change
    create_table :e_serv_educ_subetapas do |t|
      t.references :e_subetapa, null: false, foreign_key: true
      t.references :e_servico_educacional, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
