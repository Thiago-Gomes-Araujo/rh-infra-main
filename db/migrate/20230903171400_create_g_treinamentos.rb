class CreateGTreinamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :g_treinamentos do |t|
      t.string :descricao
      t.integer :carga_horaria
      t.references :g_tipo_curso, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.references :g_instituicao, null: false, foreign_key: true
      t.references :g_pessoa, null: false, foreign_key: true
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
