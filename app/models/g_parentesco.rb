class GParentesco < ApplicationRecord
  has_many :g_dependentes

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end