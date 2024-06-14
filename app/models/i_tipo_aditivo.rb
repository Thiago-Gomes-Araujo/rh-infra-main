class ITipoAditivo < ApplicationRecord
  has_many :i_aditivos
  
  validates :descricao, presence: true

  def to_s
    descricao
  end
end
