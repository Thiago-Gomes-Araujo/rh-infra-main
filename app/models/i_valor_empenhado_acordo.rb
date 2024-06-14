class IValorEmpenhadoAcordo < ApplicationRecord
  belongs_to :i_acordo

  validates :descricao, presence: true
  
  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def to_s
    descricao
  end

  def valor=(valor)
    super valor = string_to_decimal(valor)
  end
end
