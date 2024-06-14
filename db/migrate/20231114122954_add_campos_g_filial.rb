class AddCamposGFilial < ActiveRecord::Migration[7.0]
  def up
    add_column :g_filiais, :cpf_secretario, :string
    add_column :g_filiais, :nome_secretario, :string
    add_column :g_filiais, :cpf_contador, :string
    add_column :g_filiais, :nome_contador, :string
    add_column :g_filiais, :cpf_coordenador_patrimonio, :string
    add_column :g_filiais, :nome_coordenador_patrimonio, :string
    add_column :g_filiais, :sigla, :string
  end

  def down
    remove_column :g_filiais, :cpf_secretario, :string
    remove_column :g_filiais, :nome_secretario, :string
    remove_column :g_filiais, :cpf_contador, :string
    remove_column :g_filiais, :nome_contador, :string
    remove_column :g_filiais, :cpf_coordenador_patrimonio, :string
    remove_column :g_filiais, :nome_coordenador_patrimonio, :string
    remove_column :g_filiais, :sigla, :string
  end
end
