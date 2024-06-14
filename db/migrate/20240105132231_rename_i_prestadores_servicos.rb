class RenameIPrestadoresServicos < ActiveRecord::Migration[7.0]
  def up
    rename_table :i_prestadores_servicos, :i_contratados
    rename_column :i_contratos, :i_prestador_servico_id, :i_contratado_id
  end

  def down
    rename_table :i_contratados, :i_prestadores_servicos
    rename_column :i_contratos, :i_contratado_id, :i_prestador_servico_id
  end
end
