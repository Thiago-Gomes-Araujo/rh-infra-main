class GLocalidade < ApplicationRecord
  belongs_to :g_distrito
  has_many :i_extensoes

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao = descricao.upcase.strip if descricao
  end

  def to_s
    descricao
  end
end
