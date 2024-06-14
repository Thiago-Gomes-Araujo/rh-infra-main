class CreateIItensContratos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_itens_contratos do |t|
      t.string :descricao
      t.integer :quantidade
      t.references :i_contrato, null: false, foreign_key: true
      t.references :i_tipo_item_contrato, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
