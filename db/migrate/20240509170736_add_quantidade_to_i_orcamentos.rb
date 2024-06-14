class AddQuantidadeToIOrcamentos < ActiveRecord::Migration[7.0]
  def up
    add_column :i_orcamentos, :quantidade, :integer
    add_reference :i_orcamentos, :i_metafisica, null: true
  end

  def down
    remove_column :i_orcamentos, :quantidade, :integer
    remove_reference :i_orcamentos, :i_metafisica, null: true
  end
end
