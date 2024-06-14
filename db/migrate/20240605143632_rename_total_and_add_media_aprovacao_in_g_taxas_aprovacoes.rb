class RenameTotalAndAddMediaAprovacaoInGTaxasAprovacoes < ActiveRecord::Migration[7.0]
  def up
    change_column :g_taxas_aprovacoes, :total, :decimal, precision: 17, scale: 4
    rename_column :g_taxas_aprovacoes, :total, :taxa_aprovacao
    add_column :g_taxas_aprovacoes, :media_taxa_aprovacao, :decimal, precision: 17, scale: 4
  end

  def down
    change_column :g_taxas_aprovacoes, :taxa_aprovacao, :decimal, precision: 17, scale: 2
    rename_column :g_taxas_aprovacoes, :taxa_aprovacao, :total
    remove_column :g_taxas_aprovacoes, :media_taxa_aprovacao, :decimal, precision: 17, scale: 4
  end
end
