class ITipoPredio < ApplicationRecord
  belongs_to :g_secretaria
  has_many :i_predios

  validates :descricao, presence: true, uniqueness: { scope: [:deleted_at, :g_secretaria_id] }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
