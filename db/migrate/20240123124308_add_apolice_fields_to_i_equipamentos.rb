class AddApoliceFieldsToIEquipamentos < ActiveRecord::Migration[7.0]
  def up
    add_column :i_equipamentos, :numero_apolice, :string
    add_column :i_equipamentos, :inicio_vigencia_apolice, :date
    add_column :i_equipamentos, :fim_vigencia_apolice, :date
    add_reference :i_equipamentos, :i_seguradora, foreign_key: { to_table: :i_contratados }
  end

  def down
    remove_column :i_equipamentos, :numero_apolice, :string
    remove_column :i_equipamentos, :inicio_vigencia_apolice, :date
    remove_column :i_equipamentos, :fim_vigencia_apolice, :date
    remove_reference :i_equipamentos, :i_seguradora, foreign_key: { to_table: :i_contratados }
  end
end
