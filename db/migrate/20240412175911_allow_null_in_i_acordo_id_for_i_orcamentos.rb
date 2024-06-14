class AllowNullInIAcordoIdForIOrcamentos < ActiveRecord::Migration[7.0]
  def up
    change_column :i_orcamentos, :i_acordo_id, :integer, null: true
    change_column :i_orcamentos, :i_medicao_id, :integer, null: true
  end

  def down
    change_column :i_orcamentos, :i_acordo_id, :integer, null: false
    change_column :i_orcamentos, :i_medicao_id, :integer, null: false
  end
end
