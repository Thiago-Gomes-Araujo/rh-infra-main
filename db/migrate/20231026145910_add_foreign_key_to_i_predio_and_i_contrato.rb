class AddForeignKeyToIPredioAndIContrato < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_predios, :g_cartorio, foreign_key: true
    add_reference :i_contratos, :g_cartorio, foreign_key: true
  end

  def down
    remove_reference :i_predios, :g_cartorio, foreign_key: true
    remove_reference :i_contratos, :g_cartorio, foreign_key: true
  end
end
