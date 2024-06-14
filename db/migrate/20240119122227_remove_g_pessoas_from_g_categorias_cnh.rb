class RemoveGPessoasFromGCategoriasCnh < ActiveRecord::Migration[7.0]
  def up
    remove_reference :g_categorias_cnh, :g_pessoa, foreing_key: true
  end

  def down
    add_reference :g_categorias_cnh, :g_pessoa, foreing_key: true
  end
end
