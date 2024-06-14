class IStatusNotificacao < ApplicationRecord
  has_many :i_notificacoes

  validates :descricao, presence: true

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
