class ChangePercentualFieldsInIMedicao < ActiveRecord::Migration[7.0]
  def up
    change_column :i_medicoes, :percentual_fiscal, :decimal, precision: 17, scale: 2
    change_column :i_medicoes, :percentual_contratante, :decimal, precision: 17, scale: 2
  end

  def down
    change_column :i_medicoes, :percentual_fiscal, :integer
    change_column :i_medicoes, :percentual_contratante, :integer
  end
end
