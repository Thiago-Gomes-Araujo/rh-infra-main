class RemoveGPessoasFromGRacas < ActiveRecord::Migration[7.0]
  def up
    remove_reference :g_racas, :g_pessoa, foreing_key: true
  end

  def down
    add_reference :g_racas, :g_pessoa, foreing_key: true
  end
end
