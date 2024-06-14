class AddForeignKeyToEFaseServEduc < ActiveRecord::Migration[7.0]
  def up
    add_reference :e_fases_serv_educ, :e_fase, foreign_key: true
  end

  def down
    remove_reference :e_fases_serv_educ, :e_fase, foreign_key: true
  end
end
