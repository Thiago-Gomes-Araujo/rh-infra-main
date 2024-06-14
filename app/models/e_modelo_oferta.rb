class EModeloOferta < ApplicationRecord
  has_many :e_fases

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def to_s
    descricao
  end
end
