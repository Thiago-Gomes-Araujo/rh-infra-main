class CreateINotificacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :i_notificacoes do |t|
      t.string :descricao
      t.date :data_notificacao
      t.string :motivo_notificacao
      t.string :status
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
