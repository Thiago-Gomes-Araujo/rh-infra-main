class AddValueToIMedicoes < ActiveRecord::Migration[7.0]
  def up
    add_column :i_medicoes, :valor, :decimal, precision: 17, scale: 2
  end

  def down
    remove_column :i_medicoes, :valor, :decimal, precision: 17, scale: 2
  end
end
