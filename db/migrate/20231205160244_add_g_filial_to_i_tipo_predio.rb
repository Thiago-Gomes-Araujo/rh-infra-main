class AddGFilialToITipoPredio < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_tipos_predios, :g_filial, foreign_key: true
  end

  def down
    remove_reference :i_tipos_predios, :g_filial, foreign_key: true
  end
end
