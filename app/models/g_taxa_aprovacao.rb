class GTaxaAprovacao < ApplicationRecord
  include StringToDecimalPreciso
  
  belongs_to :g_municipio

=begin   
  validates :serie_1, presence: true
  validates :serie_2, presence: true
  validates :serie_3, presence: true
  validates :serie_4, presence: true
  validates :serie_5, presence: true 
=end

  validates :g_municipio_id, uniqueness: { scope: [:ano, :deleted_at], message: "já possui um registro para este ano" }

  validates :ano, presence: true
  validates :media_taxa_aprovacao, presence: true
  validates :taxa_aprovacao, presence: true

  #  DECIMAL_VALUES = [:serie_1, :serie_2, :serie_3, :serie_4, :serie_5, :total]

  decimal_values :taxa_aprovacao, :media_taxa_aprovacao
end
