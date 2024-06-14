class AddAreaLiquidaToSedamIcmsArea < ActiveRecord::Migration[7.0]
  def up
    add_column :g_sedam_icms_areas, :area_liquida, :decimal, precision: 17, scale: 2
  end
end
