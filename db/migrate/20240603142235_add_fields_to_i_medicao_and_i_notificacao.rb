class AddFieldsToIMedicaoAndINotificacao < ActiveRecord::Migration[7.0]
  def up
    rename_column :i_notificacoes, :data_notificacao, :data_inicio
    add_column :i_notificacoes, :data_fim, :date

    rename_column :i_medicoes, :data_medicao, :data_inicio
    add_column :i_medicoes, :data_fim, :date
    add_column :i_medicoes, :termo_provisorio, :boolean
    add_column :i_medicoes, :data_termo_provisorio, :date
  end

  def down
    rename_column :i_notificacoes, :data_inicio, :data_notificacao
    remove_column :i_notificacoes, :data_fim, :date

    rename_column :i_medicoes, :data_inicio, :data_medicao
    remove_column :i_medicoes, :data_fim, :date
    remove_column :i_medicoes, :termo_provisorio, :boolean
    remove_column :i_medicoes, :data_termo_provisorio, :date
  end
end
