class RenameIItensContratos < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_itens_contratos, :i_itens_acordos
  end

  def down
    rename_table  :i_itens_acordos, :i_itens_contratos
  end
end
