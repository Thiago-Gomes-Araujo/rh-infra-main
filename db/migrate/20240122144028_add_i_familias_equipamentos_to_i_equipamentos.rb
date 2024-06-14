class AddIFamiliasEquipamentosToIEquipamentos < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_equipamentos, :i_familia_equipamento, foreign_key: true
  end

  def down
    remove_reference :i_equipamentos, :i_familia_equipamento, foreign_key: true
  end
end
