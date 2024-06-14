class ChangeDataTypesInIMedicoes < ActiveRecord::Migration[7.0]
  def up
    change_column :i_medicoes, :percentual_fiscal, :decimal
    change_column :i_medicoes, :percentual_contratante, :decimal
  end

  def down
    change_column :i_medicoes, :percentual_fiscal, :integer
    change_column :i_medicoes, :percentual_contratante, :integer
  end
end
