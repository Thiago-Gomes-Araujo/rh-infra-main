class RenameESubetapasToEFases < ActiveRecord::Migration[7.0]
  def up
    rename_table :e_subetapas, :e_fases
  end

  def down
    rename_table :e_fases, :e_subetapas
  end
end
