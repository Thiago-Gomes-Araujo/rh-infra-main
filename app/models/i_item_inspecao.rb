class IItemInspecao < ApplicationRecord
  has_many :i_relacoes_inspecoes

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def to_s 
    descricao
  end
end
