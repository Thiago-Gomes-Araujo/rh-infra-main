class RenameICategoriaContrato < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_categorias_contratos, :i_categorias_acordos
    rename_column :i_acordos, :i_categoria_contrato_id, :i_categoria_acordo_id
  end

  def down
    rename_table :i_categorias_acordos, :i_categorias_contratos
    rename_column :i_acordos, :i_categoria_acordo_id, :i_categoria_contrato_id
  end
end
