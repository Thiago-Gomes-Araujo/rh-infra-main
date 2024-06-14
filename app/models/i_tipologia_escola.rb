class ITipologiaEscola < ApplicationRecord
  has_many :i_predios

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }
  validates :minimo_salas, presence: true
  validates :maximo_salas, presence: true

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
