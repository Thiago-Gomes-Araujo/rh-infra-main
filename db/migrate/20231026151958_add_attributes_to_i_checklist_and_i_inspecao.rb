class AddAttributesToIChecklistAndIInspecao < ActiveRecord::Migration[7.0]
  def up
    add_column :i_checklists, :relatorio_fotografico_ambiental, :boolean
    add_column :i_checklists, :lei_decreto_doacao, :boolean
    add_column :i_inspecoes, :inspetor, :string
  end

  def down
    remove_column :i_checklists, :relatorio_fotografico_ambiental, :boolean
    remove_column :i_checklists, :lei_decreto_doacao, :boolean
    remove_column :i_inspecoes, :inspetor, :string
  end
end
