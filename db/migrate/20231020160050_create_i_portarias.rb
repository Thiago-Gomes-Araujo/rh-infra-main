class CreateIPortarias < ActiveRecord::Migration[7.0]
  def change
    create_table :i_portarias do |t|
      t.string :descricao
      t.date :data_inicio
      t.date :data_fim
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
