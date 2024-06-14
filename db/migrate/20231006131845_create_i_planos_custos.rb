class CreateIPlanosCustos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_planos_custos do |t|
      t.integer :codigo
      t.string :tipo_consolidacao
      t.string :natureza
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
