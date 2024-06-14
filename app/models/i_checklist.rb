class IChecklist < ApplicationRecord
  belongs_to :i_predio

  has_one_attached :bic_ficha_cadastral_file, dependent: :destroy
  has_one_attached :croqui_file, dependent: :destroy
  has_one_attached :memorial_descritivo_file, dependent: :destroy
  has_one_attached :certidao_narrativa_informativa_file, dependent: :destroy
  has_one_attached :certidao_valor_venal_file, dependent: :destroy
  has_one_attached :mapa_localizacao_file, dependent: :destroy
  has_one_attached :licenca_operacao_provisoria_file, dependent: :destroy
  has_one_attached :termo_doacao_file, dependent: :destroy
  has_one_attached :lei_decreto_doacao_file, dependent: :destroy
  has_one_attached :termo_cessao_uso_anuencia_file, dependent: :destroy
  has_one_attached :certidao_inteiro_teor_file, dependent: :destroy
  has_one_attached :projeto_arquitetonico_file, dependent: :destroy
  has_one_attached :alvara_funcionamento_file, dependent: :destroy
  has_one_attached :alvara_sanitario_file, dependent: :destroy
  has_one_attached :projeto_combate_incendio_file, dependent: :destroy
  has_one_attached :spda_file, dependent: :destroy
  has_one_attached :projeto_acessibilidade_file, dependent: :destroy
  has_one_attached :laudo_tecnico_avaliacao_imoveis_file, dependent: :destroy
  has_one_attached :relatorio_fotografico_ambiental_file, dependent: :destroy
  has_one_attached :acordo_cooperacao_tecnica_file, dependent: :destroy
  has_one_attached :termo_destinacao_responsabilidade_file, dependent: :destroy


  def processo_sei=(processo_sei)
    super processo_sei = processo_sei.gsub(/[.\/-]/, "")
  end
end
