class ITipoFornecimentoExecucao < ApplicationRecord
  has_many :i_acordos

  validates :descricao, presence: true
  
  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
