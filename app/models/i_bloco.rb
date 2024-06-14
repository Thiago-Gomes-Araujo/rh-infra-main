class IBloco < ApplicationRecord
  belongs_to :i_predio
  belongs_to :i_andar
  has_many :i_ambientes_prediais

  validates :descricao, presence: true

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
