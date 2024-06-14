class GInstituicao < ApplicationRecord
  has_many :g_treinamentos
  has_many :g_cursos_idiomas
  has_many :g_niveis_escolaridades

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
