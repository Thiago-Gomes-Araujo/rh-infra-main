class AddFieldsToIPredio < ActiveRecord::Migration[7.0]
  def up
    add_column :i_predios, :area_interna_construida, :decimal, precision: 17, scale: 2
    add_column :i_predios, :area_externa_construida, :decimal, precision: 17, scale: 2
    add_column :i_predios, :total_janelas, :integer
    add_column :i_predios, :total_portas, :integer
    add_column :i_predios, :total_metros_quadrados_janelas, :decimal, precision: 17, scale: 2
    add_column :i_predios, :total_metros_quadrados_portas, :decimal, precision: 17, scale: 2
  end

  def down
    remove_column :i_predios, :area_interna_construida, :decimal, precision: 17, scale: 2
    remove_column :i_predios, :area_externa_construida, :decimal, precision: 17, scale: 2
    remove_column :i_predios, :total_janelas, :integer
    remove_column :i_predios, :total_portas, :integer
    remove_column :i_predios, :total_metros_quadrados_janelas, :decimal, precision: 17, scale: 2
    remove_column :i_predios, :total_metros_quadrados_portas, :decimal, precision: 17, scale: 2
  end
end