class CreateGCursosIdiomas < ActiveRecord::Migration[7.0]
  def change
    create_table :g_cursos_idiomas do |t|
      t.string :descricao
      t.references :g_idioma, null: false, foreign_key: true
      t.references :g_instituicao, null: false, foreign_key: true
      t.references :g_pessoa, null: false, foreign_key: true
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
