class ChangePrecisionSedam < ActiveRecord::Migration[7.0]
  def up
    change_column :g_sedam_icms_areas, :area_protegida, :decimal, precision: 17, scale: 4
    change_column :g_sedam_icms_areas, :area_antropizada, :decimal, precision: 17, scale: 4
    change_column :g_sedam_icms_areas, :area_liquida, :decimal, precision: 17, scale: 4
  end

  def down
    change_column :g_sedam_icms_areas, :area_protegida, :decimal, precision: 17, scale: 2
    change_column :g_sedam_icms_areas, :area_antropizada, :decimal, precision: 17, scale: 2
    change_column :g_sedam_icms_areas, :area_liquida, :decimal, precision: 17, scale: 2
  end
end
