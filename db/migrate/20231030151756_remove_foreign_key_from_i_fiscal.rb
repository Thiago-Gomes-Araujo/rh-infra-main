class RemoveForeignKeyFromIFiscal < ActiveRecord::Migration[7.0]
  def up
    remove_reference :i_fiscais, :i_contrato, foreign_key: true
    add_reference :i_contratos, :i_fiscal, foreign_key: true
  end

  def down
    add_reference :i_fiscais, :i_contrato, foreign_key: true
    remove_reference :i_contratos, :i_fiscal, foreign_key: true
  end
end
