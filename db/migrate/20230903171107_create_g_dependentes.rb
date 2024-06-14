class CreateGDependentes < ActiveRecord::Migration[7.0]
  def change
    create_table :g_dependentes do |t|
      t.string :nome
      t.references :g_parentesco, null: false, foreign_key: true
      t.date :data_nascimento
      t.references :g_pessoa, null: false, foreign_key: true
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
