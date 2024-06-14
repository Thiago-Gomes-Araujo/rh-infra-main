class CreateIServicosAcordos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_servicos_acordos do |t|
      t.string :descricao
      t.references :i_familia_servico_acordo, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
