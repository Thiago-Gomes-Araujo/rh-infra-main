class ITipoInspecao < ApplicationRecord

  SEMANAL = 1
  MENSAL  = 2
  COINFRA = 3

  has_many :i_itens_inspecoes
  has_many :i_relacoes_inspecoes
  has_many :i_inspecoes

  def to_s 
    descricao
  end
end
