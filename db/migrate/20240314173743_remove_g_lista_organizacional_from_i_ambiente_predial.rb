class RemoveGListaOrganizacionalFromIAmbientePredial < ActiveRecord::Migration[7.0]
  def up
    remove_reference :i_ambientes_prediais, :g_lista_organizacional, foreign_key: true
  end

  def down
    add_reference :i_ambientes_prediais, :g_lista_organizacional, foreign_key: true
  end
end
