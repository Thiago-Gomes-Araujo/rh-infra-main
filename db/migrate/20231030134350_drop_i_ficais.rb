class DropIFicais < ActiveRecord::Migration[7.0]
  def up
    remove_reference :i_medicoes, :i_ficais, foreign_key: true
    drop_table :i_ficais
  end
end
