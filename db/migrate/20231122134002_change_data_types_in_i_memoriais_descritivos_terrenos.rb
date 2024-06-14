class ChangeDataTypesInIMemoriaisDescritivosTerrenos < ActiveRecord::Migration[7.0]
  def up
    change_column :i_memoriais_descritivos_terreno, :confronte_frente, :string
    change_column :i_memoriais_descritivos_terreno, :confronte_fundos, :string
    change_column :i_memoriais_descritivos_terreno, :confronte_lado_esquerdo, :string
    change_column :i_memoriais_descritivos_terreno, :confronte_lado_direito, :string
    change_column :i_memoriais_descritivos_terreno, :area_total, :string
    change_column :i_memoriais_descritivos_terreno, :perimetro, :string
    change_column :i_memoriais_descritivos_terreno, :frente, :string
    change_column :i_memoriais_descritivos_terreno, :fundos, :string
    change_column :i_memoriais_descritivos_terreno, :lado_direito, :string
    change_column :i_memoriais_descritivos_terreno, :lado_esquerdo, :string
  end

  def down
    change_column :i_memoriais_descritivos_terreno, :confronte_frente, :decimal
    change_column :i_memoriais_descritivos_terreno, :confronte_fundos, :decimal
    change_column :i_memoriais_descritivos_terreno, :confronte_lado_esquerdo, :decimal
    change_column :i_memoriais_descritivos_terreno, :confronte_lado_direito, :decimal
    change_column :i_memoriais_descritivos_terreno, :area_total, :decimal
    change_column :i_memoriais_descritivos_terreno, :perimetro, :decimal
    change_column :i_memoriais_descritivos_terreno, :frente, :decimal
    change_column :i_memoriais_descritivos_terreno, :fundos, :decimal
    change_column :i_memoriais_descritivos_terreno, :lado_direito, :decimal
    change_column :i_memoriais_descritivos_terreno, :lado_esquerdo, :decimal
  end
end
