class CreateGListasOrganizacionais < ActiveRecord::Migration[7.0]
  def change
    create_table :g_listas_organizacionais do |t|
      t.string :sigla
      t.string :descricao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
