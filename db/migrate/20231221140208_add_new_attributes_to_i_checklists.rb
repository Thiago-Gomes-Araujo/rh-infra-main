class AddNewAttributesToIChecklists < ActiveRecord::Migration[7.0]
  def up
    add_column :i_checklists, :acordo_cooperacao_tecnica, :boolean
    add_column :i_checklists, :termo_destinacao_responsabilidade, :boolean
  end

  def down
    remove_column :i_checklists, :acordo_cooperacao_tecnica, :boolean
    remove_column :i_checklists, :termo_destinacao_responsabilidade, :boolean
  end
end
