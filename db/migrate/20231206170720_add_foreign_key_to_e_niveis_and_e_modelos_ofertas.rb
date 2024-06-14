class AddForeignKeyToENiveisAndEModelosOfertas < ActiveRecord::Migration[7.0]
  def up
    add_reference :e_etapas, :e_nivel, foreign_key: true
    add_reference :e_fases, :e_modelo_oferta, foreign_key: true
    add_reference :e_fases, :e_modalidade, foreign_key: true
  end

  def down
    remove_reference :e_etapas, :e_nivel, foreign_key: true
    remove_reference :e_fases, :e_modelo_oferta, foreign_key: true
    remove_reference :e_fases, :e_modalidade, foreign_key: true
  end
end
