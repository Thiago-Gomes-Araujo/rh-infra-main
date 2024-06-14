class AddGRacasInGPessoas < ActiveRecord::Migration[7.0]
  def up
    add_reference :g_pessoas, :g_raca, foreing_key: true
  end

  def down
    remove_reference :g_pessoas, :g_raca, foreing_key: true
  end
end
