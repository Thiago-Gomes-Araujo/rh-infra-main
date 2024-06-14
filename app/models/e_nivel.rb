class ENivel < ApplicationRecord
  has_many :e_etapas

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def to_s
    descricao
  end
end
