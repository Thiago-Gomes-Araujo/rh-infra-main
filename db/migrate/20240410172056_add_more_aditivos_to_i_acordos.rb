class AddMoreAditivosToIAcordos < ActiveRecord::Migration[7.0]
  def up
    rename_column :i_acordos, :aditivado, :aditivo_valor
    add_column :i_acordos, :aditivo_tempo, :boolean
    add_column :i_acordos, :aditivo_alteracao, :boolean
  end
  def down
    rename_column :i_acordos, :aditivo_valor, :aditivado
    remove_column :i_acordos, :aditivo_tempo
    remove_column :i_acordos, :aditivo_alteracao
  end
end
