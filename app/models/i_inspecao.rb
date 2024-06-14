class IInspecao < ApplicationRecord
  has_many :i_topicos_inspecoes, inverse_of: :i_inspecao, dependent: :destroy

  belongs_to :i_predio
  belongs_to :i_tipo_inspecao

  accepts_nested_attributes_for :i_topicos_inspecoes, reject_if: :all_blank, allow_destroy: true

  validates :descricao, presence: true
  
  validates :data_inspecao, presence: true

  validate :i_topicos_inspecoes_presence

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def processo_sei=(processo_sei)
    super processo_sei = processo_sei.gsub(/[.\/-]/, "")
  end

  private

  def i_topicos_inspecoes_presence
    if i_topicos_inspecoes.blank?
      errors.add(:base, "Preencha pelo menos uma inspeção e um status da inspeção.")
    end
  end
end
