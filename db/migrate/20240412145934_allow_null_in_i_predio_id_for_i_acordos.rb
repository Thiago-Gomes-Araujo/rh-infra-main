class AllowNullInIPredioIdForIAcordos < ActiveRecord::Migration[7.0]
  def up
    change_column :i_acordos, :i_predio_id, :integer, null: true
  end

  def down
    change_column :i_acordos, :i_predio_id, :integer, null: false
  end
end
