class RenameIContratosToIAcordos < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_contratos, :i_acordos
    rename_column :i_itens_contratos, :i_contrato_id, :i_acordo_id
    rename_column :i_medicoes, :i_contrato_id, :i_acordo_id
  end

  def down
    rename_table  :i_acordos, :i_contratos
    rename_column :i_itens_contratos, :i_acordo_id, :i_contrato_id 
    rename_column :i_medicoes, :i_acordo_id, :i_contrato_id
  end
end
