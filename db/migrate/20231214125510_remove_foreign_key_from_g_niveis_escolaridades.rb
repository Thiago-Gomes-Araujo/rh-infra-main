class RemoveForeignKeyFromGNiveisEscolaridades < ActiveRecord::Migration[7.0]
  def up
    remove_reference :g_niveis_escolaridades, :g_area, foreign_key: true
  end

  def down
    add_reference :g_niveis_escolaridades, :g_area, foreign_key: true
  end
end
