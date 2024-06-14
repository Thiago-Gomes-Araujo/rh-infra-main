class GNacionalidade < ApplicationRecord
  belongs_to :g_pais
  has_many :g_pessoas

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
