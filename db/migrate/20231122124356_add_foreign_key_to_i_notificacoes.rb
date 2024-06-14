class AddForeignKeyToINotificacoes < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_notificacoes, :i_status_notificacao, foreign_key: true
  end

  def down
    remove_reference :i_notificacoes, :i_status_notificacao, foreign_key: true
  end
end
