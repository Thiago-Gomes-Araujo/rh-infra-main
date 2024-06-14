class RenameFieldsInIPredio < ActiveRecord::Migration[7.0]
  def up
    rename_column :i_predios, :descricao, :nome_predio
    rename_column :i_predios, :rua, :logradouro
    rename_column :i_predios, :matricula, :matricula_imovel
    rename_column :i_predios, :matricula_municipio, :inscricao_cadastral
    remove_column :i_predios, :numero_certidao_inteiro_teor, :string
  end

  def down
    rename_column :i_predios, :nome_predio, :descricao
    rename_column :i_predios, :logradouro, :rua
    rename_column :i_predios, :matricula_imovel, :matricula
    rename_column :i_predios, :inscricao_cadastral, :matricula_municipio
    add_column :i_predios, :numero_certidao_inteiro_teor, :string
  end
end
