class CreateEEtapas < ActiveRecord::Migration[7.0]
  def change
    create_table :e_etapas do |t|
      t.string :descricao
      t.references :e_modalidade, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
