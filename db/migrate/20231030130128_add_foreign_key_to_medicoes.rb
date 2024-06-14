class AddForeignKeyToMedicoes < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_medicoes, :i_ficais, foreign_key: true
  end

  def down
    remove_reference :i_medicoes, :i_ficais, foreign_key: true
  end
end
