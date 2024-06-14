class CreateGTipologiasCres < ActiveRecord::Migration[7.0]
  def change
    create_table :g_tipologias_cres do |t|
      t.string :descricao
      t.integer :minimo_escolas
      t.integer :maximo_escolas
      t.integer :numero_professores_analistas
      t.integer :numero_tecnicos
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
