class ENormatizacao < ApplicationRecord
  has_many :e_atos_normativos

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
