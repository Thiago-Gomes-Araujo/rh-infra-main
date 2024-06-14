class AddFinalizadoToICorrecaoMonetaria < ActiveRecord::Migration[7.0]
  def up
    add_column :i_correcoes_monetarias, :fechada, :boolean
  end

  def down
    remove_column :i_correcoes_monetarias, :fechada, :boolean
  end
end
