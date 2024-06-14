class CreateIMedicoes < ActiveRecord::Migration[7.0]
  def change
    create_table :i_medicoes do |t|
      t.integer :percentual_fiscal
      t.date :data_medicao
      t.string :observacoes
      t.references :i_contrato, null: false, foreign_key: true
      t.references :i_notificacao, null: false, foreign_key: true
      t.integer :percentual_contratante
      t.string :created_by
      t.string :updated_by
      t.string :deleted_at

      t.timestamps
    end
  end
end
