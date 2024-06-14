class GNivelEscolaridade < ApplicationRecord
  belongs_to :g_tipo_nivel_escolaridade
  belongs_to :g_instituicao
  belongs_to :g_curso
  belongs_to :g_pessoa

  validates :data_inicio, presence: true
  validates :carga_horaria, presence: true
end
