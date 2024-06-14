class RenameITiposItensContratos < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_tipos_itens_contratos, :i_tipos_itens_acordos
    rename_column :i_itens_contratos, :i_tipo_item_contrato_id, :i_tipo_item_acordo_id
  end

  def down
    rename_table :i_tipos_itens_acordos, :i_tipos_itens_contratos
    rename_column :i_itens_contratos, :i_tipo_item_acordo_id, :i_tipo_item_contrato_id
  end
end
