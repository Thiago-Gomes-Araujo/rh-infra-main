class AddITipoContratadoToIAcordo < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_contratados, :i_tipo_contratado, foreing_key: true
    add_column :i_contratados, :cpf, :string
  end

  def down
    remove_reference :i_contratados, :i_tipo_contratado, foreing_key: true
    remove_column :i_contratados, :cpf, :string
  end
end
