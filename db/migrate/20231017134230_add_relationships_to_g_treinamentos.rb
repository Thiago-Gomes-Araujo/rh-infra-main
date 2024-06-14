class AddRelationshipsToGTreinamentos < ActiveRecord::Migration[7.0]
  def up
    add_reference :g_status_treinamentos, :g_treinamento, foreign_key: true
    add_reference :g_dimensoes, :g_treinamento, foreign_key: true
    add_reference :g_modalidades, :g_treinamento, foreign_key: true
    add_reference :g_divisoes, :g_treinamento, foreign_key: true
  end

  def down
    remove_reference :g_status_treinamentos, :g_treinamento, foreign_key: true
    remove_reference :g_dimensoes, :g_treinamento, foreign_key: true
    remove_reference :g_modalidades, :g_treinamento, foreign_key: true
    remove_reference :g_divisoes, :g_treinamento, foreign_key: true
  end
end
