class ITipoItemInspecao < ApplicationRecord
  has_many :i_inspecoes
  has_many :i_relacoes_inspecoes

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
