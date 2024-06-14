class GSedamIcmsArea < ApplicationRecord
  include StringToDecimalPreciso

  belongs_to :g_municipio
  before_save :calcula_area_liquida
  
  validates :g_municipio_id, uniqueness: { scope: [:ano, :deleted_at], message: "já possui um registro para este ano" }
  validates :ano, presence: true
  validates :area_protegida, presence: true
  validates :area_antropizada, presence: true


  decimal_values :area_antropizada, :area_protegida

  def calcula_area_liquida
    self.area_liquida =  self.area_protegida - self.area_antropizada 
  end
end











