class CreateGPessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :g_pessoas do |t|
      t.string :codigo_pessoa
      t.string :nome
      t.references :g_bairro, null: false, foreign_key: true
      t.string :certidao_militar_numero
      t.string :certidao_militar_regiao
      t.string :cnh_numero
      t.string :cnh_categoria
      t.date :cnh_validade
      t.string :cpf
      t.string :ctps_numero
      t.string :ctps_serie
      t.references :ctps_uf, null: false, foreign_key: { to_table: :g_estados }
      t.date :data_nascimento
      t.string :endereco
      t.references :g_estado_civil, null: false, foreign_key: true
      t.string :identidade_numero
      t.references :identidade_uf, null: false, foreign_key: { to_table: :g_estados }
      t.references :g_nacionalidade, null: false, foreign_key: true
      t.string :pis
      t.string :nome_mae
      t.string :nome_pai
      t.string :nome_social
      t.string :certidao_numero
      t.string :certidao_folha
      t.string :certidao_livro
      t.string :numero_termo
      t.references :g_tipo_certidao_civil, null: false, foreign_key: true
      t.references :g_deficiencia, null: false, foreign_key: true
      t.references :g_tipo_moradia, null: false, foreign_key: true
      t.string :titulo_numero
      t.string :titulo_secao
      t.string :titulo_zona
      t.references :titulo_uf, null: false, foreign_key: { to_table: :g_estados }
      t.boolean :legado
      t.string :original_user_create
      t.string :last_user_update
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
