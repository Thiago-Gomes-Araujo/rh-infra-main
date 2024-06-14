class EEtapa < ApplicationRecord
  has_many :e_fases
  belongs_to :e_nivel

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
