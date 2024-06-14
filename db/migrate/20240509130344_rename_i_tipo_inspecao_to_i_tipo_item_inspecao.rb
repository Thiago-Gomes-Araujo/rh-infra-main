class RenameITipoInspecaoToITipoItemInspecao < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_tipos_inspecao, :i_tipos_itens_inspecoes
    rename_column :i_inspecoes, :i_tipo_inspecao_id, :i_tipo_item_inspecao_id
  end

  def down
    rename_table :i_tipos_itens_inspecoes, :i_tipos_inspecao
    rename_column :i_inspecoes, :i_tipo_item_inspecao_id, :i_tipo_inspecao_id
  end
end
