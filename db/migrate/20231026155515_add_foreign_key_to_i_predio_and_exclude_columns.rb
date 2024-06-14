class AddForeignKeyToIPredioAndExcludeColumns < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_predios, :g_bairro, foreign_key: true
    remove_column :i_predios, :spda
    remove_column :i_predios, :spcip
    remove_column :i_predios, :nome_cartorio_registro_imoveis
    add_column :i_predios, :matricula_municipio, :string
  end

  def down
    remove_reference :i_predios, :g_bairro, foreign_key: true
    add_column :i_predios, :spda, :boolean
    add_column :i_predios, :spcip, :boolean
    add_column :i_predios, :nome_cartorio_registro_imoveis, :string
    remove_column :i_predios, :matricula_municipio, :string
  end
end
