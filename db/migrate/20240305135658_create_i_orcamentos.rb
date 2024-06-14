class CreateIOrcamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_orcamentos do |t|
      t.references :i_acordo, null: false, foreign_key: true
      t.references :i_medicao, null: false, foreign_key: true
      t.string :pa
      t.string :elemento_despesa
      t.decimal :valor
      t.decimal :percentual
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
