class GCursoIdioma < ApplicationRecord
  belongs_to :g_idioma
  belongs_to :g_instituicao

  validates :descricao, presence: true

  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end
end
