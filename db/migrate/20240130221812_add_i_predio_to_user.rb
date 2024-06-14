class AddIPredioToUser < ActiveRecord::Migration[7.0]
  def up
    add_reference :users, :i_predio, foreing_key: true
  end

  def down
    remove_reference :users, :i_predio, foreing_key: true
  end
end
