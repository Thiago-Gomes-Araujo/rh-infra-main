class RenameIPlanosCustos < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_planos_custos, :i_contas_contabeis
  end

  def down
    rename_table :i_contas_contabeis, :i_planos_custos
  end
end
