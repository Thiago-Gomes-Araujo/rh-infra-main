class GTipologiaCre < ApplicationRecord
  has_many :g_cres

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }
  validates :minimo_escolas, presence: true
  validates :maximo_escolas, presence: true

  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
