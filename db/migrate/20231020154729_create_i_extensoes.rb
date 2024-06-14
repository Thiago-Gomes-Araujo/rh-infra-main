class CreateIExtensoes < ActiveRecord::Migration[7.0]
  def change
    create_table :i_extensoes do |t|
      t.string :descricao
      t.string :portaria
      t.date :data_inicio_validade
      t.date :data_fim_validade
      t.string :processo_sei
      t.references :i_predio, null: false, foreign_key: true
      t.references :i_predio_entidade_proprietaria, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
