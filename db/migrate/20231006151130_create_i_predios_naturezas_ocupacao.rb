class CreateIPrediosNaturezasOcupacao < ActiveRecord::Migration[7.0]
  def change
    create_table :i_predios_naturezas_ocupacao do |t|
      t.string :descricao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end