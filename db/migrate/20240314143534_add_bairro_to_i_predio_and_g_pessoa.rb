class AddBairroToIPredioAndGPessoa < ActiveRecord::Migration[7.0]
  def up
    add_column :i_predios, :bairro, :string
    add_column :g_pessoas, :bairro, :string
  end

  def down
    remove_column :i_predios, :bairro, :string
    remove_column :g_pessoas, :bairro, :string
  end
end
