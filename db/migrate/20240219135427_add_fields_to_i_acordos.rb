class AddFieldsToIAcordos < ActiveRecord::Migration[7.0]
  def up
    add_column :i_valores_empenhados_acordos, :valor, :decimal, precision: 17, scale: 2
    add_column :i_valores_empenhados_acordos, :data, :date
  end

  def down
    remove_column :i_valores_empenhados_acordos, :valor, :decimal, precision: 17, scale: 2
    remove_column :i_valores_empenhados_acordos, :data, :date
  end
end
