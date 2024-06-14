class AddAnoToIndiceSocioeconomico < ActiveRecord::Migration[7.0]
  def up 
    add_column :g_indices_socioeconomicos, :ano, :integer
  end
  def down 
    remove_column :g_indices_socioeconomicos, :ano, :integer
  end
end
