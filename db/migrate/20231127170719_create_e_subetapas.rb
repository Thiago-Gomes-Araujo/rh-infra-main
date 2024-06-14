class CreateESubetapas < ActiveRecord::Migration[7.0]
  def change
    create_table :e_subetapas do |t|
      t.string :descricao
      t.references :e_etapa, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
