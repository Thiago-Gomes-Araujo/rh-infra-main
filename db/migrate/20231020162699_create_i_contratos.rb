class CreateIContratos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_contratos do |t|
      t.string :descricao
      t.date :data_inicio
      t.date :data_fim
      t.string :observacoes
      t.references :i_predio, null: false, foreign_key: true
      t.decimal :valor
      t.decimal :valor_aditivo
      t.references :i_patrocinador, null: false, foreign_key: true
      t.string :portaria_fiscal
      t.string :sei_financeiro
      t.string :sei_execucao
      t.references :i_categoria_contrato, null: false, foreign_key: true
      t.string :objeto
      t.string :nota_empenho
      t.string :gestor_contrato
      t.string :ordem_servico
      t.date :data_entrega
      t.references :i_status_contrato, null: false, foreign_key: true
      t.boolean :contrato_aditivado
      t.date :data_fim_aditivo
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
