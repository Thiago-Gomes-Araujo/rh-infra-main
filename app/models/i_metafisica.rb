class IMetafisica < ApplicationRecord
  has_many :i_orcamentos

  def to_s
    descricao
  end
end
