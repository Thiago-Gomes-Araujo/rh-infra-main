class AddForeignKeyToBlocos < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_blocos, :i_andar, foreign_key: true
    add_reference :i_blocos, :i_predio, foreign_key: true
  end

  def down
    remove_reference :i_blocos, :i_andar, foreign_key: true
    remove_reference :i_blocos, :i_predio, foreign_key: true
  end
end
