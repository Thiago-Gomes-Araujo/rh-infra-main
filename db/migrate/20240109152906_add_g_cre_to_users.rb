class AddGCreToUsers < ActiveRecord::Migration[7.0]
  def up
    add_reference :users, :g_cre, foreing_key: true
  end

  def down
    remove_reference :users, :g_cre, foreing_key: true
  end
end
