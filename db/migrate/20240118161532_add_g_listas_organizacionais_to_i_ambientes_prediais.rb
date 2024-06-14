class AddGListasOrganizacionaisToIAmbientesPrediais < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_ambientes_prediais, :g_lista_organizacional, foreign_key: true
  end

  def down
    remove_reference :i_ambientes_prediais, :g_lista_organizacional, foreign_key: true
  end
end
