class AddForeignKeyToCorrecoesMonetarias < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_correcoes_monetarias, :i_predio, foreign_key: true
  end

  def down
    remove_reference :i_correcoes_monetarias, :i_predio, foreign_key: true
  end
end
