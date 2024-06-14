class RemoveTipoInspecaoToInspecao < ActiveRecord::Migration[7.0]
  def up
    remove_reference :i_inspecoes, :i_tipo_item_inspecao, foreign_key: true
  end

  def down
    add_reference :i_inspecoes, :i_tipo_item_inspecao, foreign_key: true
  end
end
