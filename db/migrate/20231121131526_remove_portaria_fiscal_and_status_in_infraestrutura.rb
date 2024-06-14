class RemovePortariaFiscalAndStatusInInfraestrutura < ActiveRecord::Migration[7.0]
  def up
    remove_column :i_contratos, :portaria_fiscal, :string
    remove_column :i_notificacoes, :status, :string
  end

  def down
    add_column :i_contratos, :portaria_fiscal, :string
    add_column :i_notificacoes, :status, :string
  end
end
