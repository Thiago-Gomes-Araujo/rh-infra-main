class CreateGBairros < ActiveRecord::Migration[7.0]
  def change
    create_table :g_bairros do |t|
      t.string :descricao
      t.references :g_municipio, null: false, foreign_key: true
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
