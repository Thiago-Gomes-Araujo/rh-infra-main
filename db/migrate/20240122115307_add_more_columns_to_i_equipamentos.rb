class AddMoreColumnsToIEquipamentos < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_equipamentos, :g_municipio_placa, foreign_key: { to_table: :g_municipios }
    add_reference :i_equipamentos, :i_fornecedor, foreign_key: { to_table: :i_contratados }
  end

  def down
    remove_reference :i_equipamentos, :g_municipio_placa, foreign_key: { to_table: :g_municipios }
    remove_reference :i_equipamentos, :i_fornecedor, foreign_key: { to_table: :i_contratados }
  end
end
