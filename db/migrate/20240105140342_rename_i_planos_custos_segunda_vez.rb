class RenameIPlanosCustosSegundaVez < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_planos_custos, :i_contas_contabeis
    rename_column :i_predios, :i_plano_custo_id, :i_conta_contabil_id
  end

  def down
    rename_table :i_contas_contabeis, :i_planos_custos
    rename_column :i_predios, :i_conta_contabil_id, :i_plano_custo_id
  end
end
