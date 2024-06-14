class IExtensao < ApplicationRecord
  belongs_to :i_predio
  belongs_to :i_predio_mantenedor_proprietario
  belongs_to :g_localidade
  belongs_to :i_predio_situacao

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  def descricao=(descricao)
    super descricao = descricao.upcase.strip if descricao
  end

  def processo_sei=(processo_sei)
    super processo_sei = processo_sei.gsub(/[.\/-]/, "")
  end

  scope :query_index, -> {
          includes(
            :i_predio_mantenedor_proprietario,
            :g_localidade,
            :i_predio_situacao,
            i_predio: :g_cre,
          ).joins(
            :i_predio_mantenedor_proprietario,
            :g_localidade,
            :i_predio_situacao,
            i_predio: :g_cre,
          )
        }
end
