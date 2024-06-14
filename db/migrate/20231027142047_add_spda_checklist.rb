class AddSpdaChecklist < ActiveRecord::Migration[7.0]
  def up
    add_column :i_checklists, :spda, :boolean
    add_column :i_checklists, :projeto_combate_incendio, :boolean
  end

  def down
    remove_column :i_checklists, :spda, :boolean
    remove_column :i_checklists, :projeto_combate_incendio, :boolean
  end
end
