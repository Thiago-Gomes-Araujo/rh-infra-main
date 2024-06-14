class MudancaTipoCodigoIPlanoCusto < ActiveRecord::Migration[7.0]
  def up
    change_column :i_planos_custos, :codigo, :string
  end

  def down
    change_column :i_planos_custos, :codigo, :integer
  end
end
