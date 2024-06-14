class RenameEServEducSubetapasToEFasesServEduc < ActiveRecord::Migration[7.0]
  def up
    rename_table :e_serv_educ_subetapas, :e_fases_serv_educ
  end

  def down
    rename_table :e_fases_serv_educ, :e_serv_educ_subetapas
  end
end
