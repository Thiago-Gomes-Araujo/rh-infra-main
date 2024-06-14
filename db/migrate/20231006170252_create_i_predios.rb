class CreateIPredios < ActiveRecord::Migration[7.0]
  def change
    create_table :i_predios do |t|
      t.string :descricao
      t.references :i_tipo_predio, null: false, foreign_key: true
      t.string :codigo_inep
      t.string :matricula
      t.string :codigo_imovel
      t.string :estrutura
      t.references :i_tipologia_escola, null: false, foreign_key: true
      t.boolean :educacao_integral
      t.references :g_localidade, null: false, foreign_key: true
      t.string :latitude
      t.string :longitude
      t.references :g_filial, null: false, foreign_key: true
      t.string :numero_endereco
      t.string :complemento
      t.string :telefone_contato
      t.string :telefone_predio
      t.string :email_responsavel
      t.references :i_predio_situacao, null: false, foreign_key: true
      t.date :data_inicio_atividades
      t.date :data_fim_atividades
      t.references :i_predio_localizacao, null: false, foreign_key: true
      t.references :i_predio_entidade_proprietaria, null: false, foreign_key: true
      t.references :i_predio_tipo_localizacao_diferenciada, null: false, foreign_key: true
      t.references :i_predio_natureza_ocupacao, null: false, foreign_key: true
      t.boolean :documentacao_propriedade
      t.string :numero_certidao_inteiro_teor
      t.boolean :agua_potavel
      t.references :i_predio_tipo_abastecimento, null: false, foreign_key: true
      t.references :i_predio_tipo_energia_eletrica, null: false, foreign_key: true
      t.references :i_predio_esgoto_sanitario, null: false, foreign_key: true
      t.references :i_predio_destinacao_lixo, null: false, foreign_key: true
      t.references :i_predio_tratamento_lixo, null: false, foreign_key: true
      t.references :i_predio_estrutura, null: false, foreign_key: true
      t.boolean :spda
      t.boolean :spcip
      t.decimal :valor_original
      t.decimal :valor_reavaliado
      t.references :i_plano_custo, null: false, foreign_key: true
      t.decimal :valor_terreno
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
