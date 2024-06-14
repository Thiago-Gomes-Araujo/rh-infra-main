class GTreinamento < ApplicationRecord
  belongs_to :g_tipo_curso
  belongs_to :g_instituicao
  belongs_to :g_dimesao
  belongs_to :g_divisao
  belongs_to :g_modalidades
  belongs_to :status_treinamentos

  validates :descricao, presence: true
  validates :carga_horaria, presence: true
  validates :data_inicio, presence: true

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
