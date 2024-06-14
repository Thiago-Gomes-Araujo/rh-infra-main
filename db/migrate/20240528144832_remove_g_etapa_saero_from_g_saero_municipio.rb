class RemoveGEtapaSaeroFromGSaeroMunicipio < ActiveRecord::Migration[7.0]
  def up
    remove_reference :g_saero_municipios, :g_etapa_saero, foreign_key: true
  end

  def down
    add_reference :g_saero_municipios, :g_etapa_saero, foreign_key: true
  end
end
