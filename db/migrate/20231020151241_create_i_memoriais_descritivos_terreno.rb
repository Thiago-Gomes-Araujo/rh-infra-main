class CreateIMemoriaisDescritivosTerreno < ActiveRecord::Migration[7.0]
  def change
    create_table :i_memoriais_descritivos_terreno do |t|
      t.references :i_predio, null: false, foreign_key: true
      t.decimal :confronte_frente
      t.decimal :confronte_fundos
      t.decimal :confronte_lado_esquerdo
      t.decimal :confronte_lado_direito
      t.decimal :area_total
      t.decimal :perimetro
      t.decimal :frente
      t.decimal :fundos
      t.decimal :lado_direito
      t.decimal :lado_esquerdo
      t.string :tipo_construcao
      t.string :observacao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
