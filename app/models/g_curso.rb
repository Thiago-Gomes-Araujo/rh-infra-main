class GCurso < ApplicationRecord
  has_many :g_niveis_escolaridades
  belongs_to :g_area

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
