class AddEnderecoColumnsToIPredio < ActiveRecord::Migration[7.0]
  def up
    add_column :i_predios, :CEP, :string
    add_column :i_predios, :rua, :string
  end

  def down
    remove_column :i_predios, :CEP, :string
    remove_column :i_predios, :rua, :string
  end
end
