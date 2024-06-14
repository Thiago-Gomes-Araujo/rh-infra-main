class IItemAcordo < ApplicationRecord
  belongs_to :i_acordo
  belongs_to :i_tipo_item_acordo

  validates :descricao, presence: true

  def descricao=(descricao)
    super descricao = descricao.upcase.strip if descricao
  end
end
