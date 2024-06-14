class AddForeignKeyToIPredio < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_predios, :e_especificidade, foreign_key: true
  end

  def down
    remove_reference :i_predios, :e_especificidade, foreign_key: true
  end
end
