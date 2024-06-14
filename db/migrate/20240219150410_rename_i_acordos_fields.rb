class RenameIAcordosFields < ActiveRecord::Migration[7.0]
  def up
    rename_column :i_acordos, :numero_contrato, :numero_acordo
    rename_column :i_acordos, :gestor_contrato, :gestor
    rename_column :i_acordos, :contrato_aditivado, :aditivado
  end

  def down
    rename_column :i_acordos, :numero_acordo, :numero_contrato
    rename_column :i_acordos, :gestor, :gestor_contrato
    rename_column :i_acordos, :aditivado, :contrato_aditivado
  end
end
