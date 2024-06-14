class GIndiceSocioeconomico < ApplicationRecord
  include StringToDecimalPreciso
  
  belongs_to :g_municipio

  validates :g_municipio_id, uniqueness: { scope: [:ano, :deleted_at], message: "já possui um registro para este ano" }

  validates :indice, presence: true
  validates :ano, presence: true

  decimal_values :indice

end
