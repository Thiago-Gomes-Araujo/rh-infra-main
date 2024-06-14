class AddAnoToSedamIcms < ActiveRecord::Migration[7.0]
  def up
    add_column :g_sedam_icms_areas, :ano, :integer
  end
  def down
    remove_column :g_sedam_icms_areas, :ano, :integer
  end
end
