class AddForeignKeyToGCursos < ActiveRecord::Migration[7.0]
  def up
    add_reference :g_cursos, :g_area, foreign_key: true
  end

  def down
    remove_reference :g_cursos, :g_area, foreign_key: true
  end
end
