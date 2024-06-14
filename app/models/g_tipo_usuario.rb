class GTipoUsuario < ApplicationRecord
  has_many :user  
  
  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def to_s
    descricao
  end
end
