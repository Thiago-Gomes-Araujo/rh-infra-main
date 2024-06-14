class AddIConformidadeToIPredios < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_predios, :i_conformidade_terreno, foreign_key: { to_table: :i_conformidades }
    add_reference :i_predios, :i_conformidade_edificacao, foreign_key: { to_table: :i_conformidades }
  end

  def down
    remove_reference :i_predios, :i_conformidade_terreno, foreign_key: { to_table: :i_conformidades }
    remove_reference :i_predios, :i_conformidade_edificacao, foreign_key: { to_table: :i_conformidades }
  end
end
