class GDimensao < ApplicationRecord
  has_many :g_treinamentos

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
