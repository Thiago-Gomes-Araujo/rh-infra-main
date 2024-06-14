class CreateGEstados < ActiveRecord::Migration[7.0]
  def change
    create_table :g_estados do |t|
      t.string :descricao
      t.string :uf
      t.references :g_pais, null: false, foreign_key: true
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
