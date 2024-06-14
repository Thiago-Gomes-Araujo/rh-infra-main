class CreateITipologiasEscolas < ActiveRecord::Migration[7.0]
  def change
    create_table :i_tipologias_escolas do |t|
      t.string :descricao
      t.integer :minimo_salas
      t.integer :maximo_salas
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
