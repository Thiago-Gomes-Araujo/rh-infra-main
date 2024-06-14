class RenameIPrediosEntidadesProprietaria < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_predios_entidades_proprietaria, :i_predios_mantenedores_proprietarios
    rename_column :i_predios, :i_predio_entidade_proprietaria_id, :i_predio_mantenedor_proprietario_id
    rename_column :i_extensoes, :i_predio_entidade_proprietaria_id, :i_predio_mantenedor_proprietario_id
  end

  def down
    rename_table :i_predios_mantenedores_proprietarios, :i_predios_entidades_proprietaria
    rename_column :i_predios, :i_predio_mantenedor_proprietario_id, :i_predio_entidade_proprietaria_id
    rename_column :i_extensoes, :i_predio_mantenedor_proprietario_id, :i_predio_entidade_proprietaria_id
  end
end
