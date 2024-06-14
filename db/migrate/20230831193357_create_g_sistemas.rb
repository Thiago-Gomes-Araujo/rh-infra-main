class CreateGSistemas < ActiveRecord::Migration[7.0]
  def change
    create_table :g_sistemas do |t|
      t.string :letra
      t.string :nome
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
