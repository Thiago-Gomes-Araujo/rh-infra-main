class AddRelationshipsToRacasAndCnh < ActiveRecord::Migration[7.0]
  def up
    add_reference :g_racas, :g_pessoa, foreign_key: true
    add_reference :g_categorias_cnh, :g_pessoa, foreign_key: true
  end

  def down
    remove_reference :g_racas, :g_pessoa, foreign_key: true
    remove_reference :g_categorias_cnh, :g_pessoa, foreign_key: true
  end
end
