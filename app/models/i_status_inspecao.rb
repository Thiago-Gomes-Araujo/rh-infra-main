class IStatusInspecao < ApplicationRecord
  has_many :i_topicos_inspecoes

  IRREGULAR = 1
  OK        = 2
  PESSIMO   = 3
  RUIM      = 4
  REGULAR   = 5
  BOM       = 6
  OTIMO     = 7

  def to_s 
    descricao
  end
end
