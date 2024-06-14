class AddNumeroMedicaotoIMedicoes < ActiveRecord::Migration[7.0]
  def up
    add_column :i_medicoes, :numero_medicoes, :integer
  end

  def down
    remove_column :i_medicoes, :numero_medicoes, :integer
  end
end
