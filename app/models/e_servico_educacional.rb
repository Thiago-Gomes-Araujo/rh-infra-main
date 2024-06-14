class EServicoEducacional < ApplicationRecord
  belongs_to :e_ato_normativo
  has_many :e_serv_educ_subetapas

  validates :nome, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(nome)
    super nome.upcase.strip
  end

  def to_s
    nome
  end
end
