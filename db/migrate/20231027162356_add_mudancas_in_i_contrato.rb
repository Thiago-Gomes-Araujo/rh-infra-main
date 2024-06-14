class AddMudancasInIContrato < ActiveRecord::Migration[7.0]
  def up
    add_column :i_contratos, :numero_contrato, :string
    add_reference :i_contratos, :i_prestador_servico, foreign_key: true
  end

  def down
    remove_column :i_contratos, :numero_contrato, :string
    remove_reference :i_contratos, :i_prestador_servico, foreign_key: true
  end
end
