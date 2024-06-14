class AddCamposPadroesIPrestadoresServicos < ActiveRecord::Migration[7.0]
  def up
    add_column :i_prestadores_servicos, :created_by, :string
    add_column :i_prestadores_servicos, :updated_by, :string
    add_column :i_prestadores_servicos, :deleted_at, :datetime
  end

  def down
    remove_column :i_prestadores_servicos, :created_by, :string
    remove_column :i_prestadores_servicos, :updated_by, :string
    remove_column :i_prestadores_servicos, :deleted_at, :datetime
  end
end
