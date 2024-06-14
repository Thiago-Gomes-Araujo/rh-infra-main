class AddCamposChecklist < ActiveRecord::Migration[7.0]
  def up
    add_column :i_checklists, :certidao_inteiro_teor, :boolean
  end

  def down
    remove_column :i_checklists, :certidao_inteiro_teor, :boolean
  end
end
