class CreateIAmbientesPrediais < ActiveRecord::Migration[7.0]
  def change
    create_table :i_ambientes_prediais do |t|
      t.string :descricao
      t.references :i_tipo_ambiente_predial, null: false, foreign_key: true
      t.references :i_bloco, null: false, foreign_key: true
      t.integer :metros_quadrados
      t.integer :capacidade
      t.integer :comprimento
      t.integer :largura
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
