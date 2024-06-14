class CreateGPaises < ActiveRecord::Migration[7.0]
  def change
    create_table :g_paises do |t|
      t.string :descricao
      t.string :sigla
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
