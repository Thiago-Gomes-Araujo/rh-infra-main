class IPredioSituacao < ApplicationRecord
  has_many :i_predios
  has_many :i_extensoes

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
