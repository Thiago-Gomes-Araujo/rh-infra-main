class AddAndRemoveDetailsToGPessoa < ActiveRecord::Migration[7.0]
  def up
    add_column :g_pessoas, :endereco_numero, :string
    add_column :g_pessoas, :email, :string
    add_column :g_pessoas, :telefone, :string
    remove_column :g_pessoas, :cnh_numero
    remove_column :g_pessoas, :cnh_categoria
  end

  def down
    remove_column :g_pessoas, :endereco_numero
    remove_column :g_pessoas, :email
    remove_column :g_pessoas, :telefone
    add_column :g_pessoas, :cnh_numero, :string
    add_column :g_pessoas, :cnh_categoria, :string
  end
end
