class RemoveAditivosFieldsFromIAcordos < ActiveRecord::Migration[7.0]
  def up
    remove_column :i_acordos, :aditivo_valor
    remove_column :i_acordos, :aditivo_tempo
    remove_column :i_acordos, :aditivo_alteracao
    remove_column :i_acordos, :valor_aditivo
    remove_column :i_acordos, :data_fim_aditivo
  end

  def down
    add_column :i_acordos, :aditivo_valor, :boolean
    add_column :i_acordos, :aditivo_tempo, :boolean
    add_column :i_acordos, :aditivo_alteracao, :boolean
    add_column :i_acordos, :valor_aditivo, :decimal
    add_column :i_acordos, :data_fim_aditivo, :date
  end
end
