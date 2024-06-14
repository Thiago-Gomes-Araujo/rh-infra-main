class AddAttributesToIPredios < ActiveRecord::Migration[7.0]
  def up
    add_column :i_predios, :nome_cartorio_registro_imoveis, :string
    add_column :i_predios, :valor_edificacao_infraobras, :decimal
    add_column :i_predios, :endereco, :string
    add_reference :i_predios, :i_mantenedor, foreign_key: { to_table: :i_predios_entidades_proprietaria }
    add_reference :i_predios, :g_cre, foreign_key: true
  end

  def down
    remove_column :i_predios, :nome_cartorio_registro_imoveis, :string
    remove_column :i_predios, :valor_edificacao_infraobras, :decimal
    remove_column :i_predios, :endereco, :string
    remove_reference :i_predios, :i_mantenedor, foreign_key: { to_table: :i_predios_entidades_proprietaria }
    remove_reference :i_predios, :g_cre, foreign_key: true
  end
end
