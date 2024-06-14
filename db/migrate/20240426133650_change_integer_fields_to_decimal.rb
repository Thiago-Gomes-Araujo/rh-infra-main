class ChangeIntegerFieldsToDecimal < ActiveRecord::Migration[7.0]
  def up
    change_column :i_ambientes_prediais, :metros_quadrados, :decimal, precision: 17, scale: 2
    change_column :i_ambientes_prediais, :comprimento, :decimal, precision: 17, scale: 2
    change_column :i_ambientes_prediais, :largura, :decimal, precision: 17, scale: 2
  end

  def down
    change_column :i_ambientes_prediais, :metros_quadrados, :integer
    change_column :i_ambientes_prediais, :comprimento, :integer
    change_column :i_ambientes_prediais, :largura, :integer
  end
end
