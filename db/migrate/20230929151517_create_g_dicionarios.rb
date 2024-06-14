class CreateGDicionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :g_dicionarios do |t|
      t.string :nome_tabela
      t.string :campo_tabela
      t.string :descricao
      t.references :g_sistema, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
