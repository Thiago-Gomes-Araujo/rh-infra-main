class CreateIRelacoesInspecoes < ActiveRecord::Migration[7.0]
  def change
    create_table :i_relacoes_inspecoes do |t|
      t.references :i_tipo_item_inspecao, null: false, foreign_key: true
      t.references :i_item_inspecao, null: false, foreign_key: true
      t.references :i_tipo_inspecao, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
