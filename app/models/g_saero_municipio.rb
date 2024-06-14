class GSaeroMunicipio < ApplicationRecord
  include StringToDecimalPreciso
  
  belongs_to :g_municipio

  validates :g_municipio_id, uniqueness: { scope: [:ano, :deleted_at], message: "já possui um registro para este ano" }

  validates :ano, presence: true
  validates :iqa, presence: true
  validates :iqf, presence: true

  #  before_save :calcula_iqa_e_iqf

  #  DECIMAL_VALUES = [:indice_lp_segundo_ano, :indice_mt_segundo_ano, :indice_lp_quinto_ano, :indice_mt_quinto_ano]

  decimal_values :iqa, :iqf
=begin 
  def calcula_iqa_e_iqf
    self.iqa = (self.indice_lp_segundo_ano.to_f + self.indice_mt_segundo_ano.to_f) / 2
    self.iqf = (self.indice_lp_quinto_ano.to_f + self.indice_mt_quinto_ano.to_f) / 2
  end 
=end
end
