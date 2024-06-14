class AddDataFinalToIValoresEmpenhadosAcordos < ActiveRecord::Migration[7.0]
  def up
    add_column :i_valores_empenhados_acordos, :data_final, :date
    rename_column :i_valores_empenhados_acordos, :data, :data_inicial
  end

  def down
    remove_column :i_valores_empenhados_acordos, :data_final, :date
    rename_column :i_valores_empenhados_acordos, :data_inicial, :data
  end
end
