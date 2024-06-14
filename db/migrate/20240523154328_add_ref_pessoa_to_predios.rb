class AddRefPessoaToPredios < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_predios, :g_pessoa, null: true, foreign_key: true
  end

  def down
    remove_reference :i_predios, :g_pessoa, null: true, foreign_key: true
  end
end
