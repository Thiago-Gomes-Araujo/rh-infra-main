class RemoveGBairroFromIPredioAndGPessoa < ActiveRecord::Migration[7.0]
  def up
    remove_reference :g_pessoas, :g_bairro, foreign_key: true
    remove_reference :i_predios, :g_bairro, foreing_key: true
    drop_table :g_bairros
  end

  def down
    create_table :g_bairros do |t|
      t.string :descricao
      t.references :g_municipio, null: false, foreign_key: true
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
      add_reference :g_pessoas, :g_bairro, foreign_key: true
      add_reference :i_predios, :g_bairro, foreing_key: true
  end
end
