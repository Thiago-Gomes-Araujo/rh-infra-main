class RenameIStatusContrato < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_status_contratos, :i_status_acordos
    rename_column :i_acordos, :i_status_contrato_id, :i_status_acordo_id
  end

  def down
    rename_table :i_status_acordos, :i_status_contratos
    rename_column :i_acordos, :i_status_acordo_id, :i_status_contrato_id
  end
end
