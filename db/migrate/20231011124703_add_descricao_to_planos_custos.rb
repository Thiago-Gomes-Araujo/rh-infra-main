class AddDescricaoToPlanosCustos < ActiveRecord::Migration[7.0]
  def up
    add_column :i_planos_custos, :descricao, :string
  end

  def down
    remove_column :i_planos_custos, :descricao
  end
end
