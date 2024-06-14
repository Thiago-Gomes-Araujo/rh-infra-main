class AddGCategoriasCnhToGPessoas < ActiveRecord::Migration[7.0]
  def up
    add_reference :g_pessoas, :g_categoria_cnh, foreing_key: true
    add_column :g_pessoas, :cnh_numero, :string
  end

  def down
    remove_reference :g_pessoas, :g_categoria_cnh, foreing_key: true
    remove_column :g_pessoas, :cnh_numero, :string
  end
end
