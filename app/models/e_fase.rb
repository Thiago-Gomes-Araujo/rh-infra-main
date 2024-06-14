class EFase < ApplicationRecord
  belongs_to :e_etapa
  belongs_to :e_modelo_oferta
  belongs_to :e_modalidade
  has_many :e_fases_serv_educ

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
