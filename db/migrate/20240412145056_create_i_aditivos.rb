class CreateIAditivos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_aditivos do |t|
      t.references :i_acordo, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.decimal :valor
      t.text :alteracao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
