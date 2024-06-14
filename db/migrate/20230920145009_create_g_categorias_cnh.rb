class CreateGCategoriasCnh < ActiveRecord::Migration[7.0]
  def change
    create_table :g_categorias_cnh do |t|
      t.string :descricao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end