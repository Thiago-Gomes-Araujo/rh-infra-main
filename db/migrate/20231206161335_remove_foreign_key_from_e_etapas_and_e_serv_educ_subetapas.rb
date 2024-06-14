class RemoveForeignKeyFromEEtapasAndEServEducSubetapas < ActiveRecord::Migration[7.0]
  def up
    remove_reference :e_etapas, :e_modalidade, foreign_key: true
    remove_reference :e_serv_educ_subetapas, :e_subetapa, foreign_key: true
  end

  def down
    add_reference :e_etapas, :e_modalidade, foreign_key: true
    add_reference :e_serv_educ_subetapas, :e_subetapa, foreign_key: true
  end
end
