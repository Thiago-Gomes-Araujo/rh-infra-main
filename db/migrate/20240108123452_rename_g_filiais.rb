class RenameGFiliais < ActiveRecord::Migration[7.0]
  def up
    rename_table :g_filiais, :g_secretarias
    rename_column :i_predios, :g_filial_id, :g_secretaria_id
    rename_column :i_tipos_predios, :g_filial_id, :g_secretaria_id
    rename_column :users, :g_filial_id, :g_secretaria_id
  end

  def down
    rename_table :g_secretarias, :g_filiais
    rename_column :i_predios, :g_secretaria_id, :g_filial_id
    rename_column :i_tipos_predios, :g_secretaria_id, :g_filial_id
    rename_column :users, :g_secretaria_id, :g_filial_id
  end
end
