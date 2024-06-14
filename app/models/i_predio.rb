class IPredio < ApplicationRecord
  belongs_to :g_pessoa, optional: true
  belongs_to :i_tipo_predio
  belongs_to :i_tipologia_escola
  belongs_to :g_localidade
  belongs_to :g_secretaria
  belongs_to :i_predio_situacao
  belongs_to :i_predio_localizacao
  belongs_to :i_predio_mantenedor_proprietario
  belongs_to :i_predio_tipo_localizacao_diferenciada
  belongs_to :i_predio_natureza_ocupacao
  belongs_to :i_predio_tipo_abastecimento
  belongs_to :i_predio_tipo_energia_eletrica
  belongs_to :i_predio_esgoto_sanitario
  belongs_to :i_predio_destinacao_lixo
  belongs_to :i_predio_tratamento_lixo
  belongs_to :i_predio_estrutura
  belongs_to :i_conta_contabil
  belongs_to :i_conformidade_terreno, class_name: "IConformidade", foreign_key: "i_conformidade_terreno_id"
  belongs_to :i_conformidade_edificacao, class_name: "IConformidade", foreign_key: "i_conformidade_edificacao_id"
  belongs_to :i_mantenedor, class_name: "IPredioMantenedorProprietario", foreign_key: "i_mantenedor_id"
  belongs_to :g_cre
  belongs_to :g_cartorio
  belongs_to :e_especificidade
  has_many :i_checklists
  has_many :i_blocos
  has_many :i_correcoes_monetarias
  has_many :i_extensoes
  has_many :i_inspecoes
  has_many :i_memoriais_descritivos_terreno
  has_many :i_acordos
  has_many :e_regimentos
  has_many :e_atos_normativos
  has_many :users

  validates :nome_predio, presence: true
  validate :length_codigo_inep
  validates :codigo_inep, uniqueness: { scope: :deleted_at, conditions: -> { where(deleted_at: nil) } }, if: -> { codigo_inep.present? }

  STRINGS_TO_UPCASE_AND_STRIP = [:nome_predio, :rua, :complemento]
  STRINGS_TO_UPCASE_AND_STRIP.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def telefone_predio=(telefone_predio)
    super telefone_predio = telefone_predio.gsub(/[()-]/, "").strip
  end

  def telefone_contato=(telefone_contato)
    super telefone_contato = telefone_contato.gsub(/[()-]/, "").strip
  end

  def cep=(cep)
    super cep = cep.gsub(/[-]/, "")
  end

  def to_s
    nome_predio
  end

  def predio_localidade
    "#{nome_predio} - #{g_localidade.descricao}"
  end

  def cre_predio
    "#{g_cre&.descricao} - #{nome_predio}"
  end

  def inep_predio_cre
    "#{codigo_inep} - #{nome_predio} - #{g_cre&.descricao}"
  end

  DECIMAL_VALUES = [:valor_original, :valor_reavaliado, :valor_terreno, :valor_edificacao_infraobras]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val)
    end
  end

  scope :filtro_por_usuario, ->(current_user) {
          query = includes(:g_localidade, :g_cre, :i_tipo_predio)
          query = query.where(g_secretaria_id: current_user.g_secretaria_id)
          query = query.where(g_cre_id: current_user.g_cre_id) if current_user.g_cre_id&.!= 1 # 1 se refere ao dado "NÃO SE APLICA"
          query = query.where(id: current_user.i_predio_id) if current_user.i_predio_id
          query = query.order(:nome_predio)
        }

  scope :tc16, ->(g_secretaria) {
          select(
            "i_predios.id",
            "i_predios.matricula_imovel AS matricula",
            "g_cartorios.descricao AS cartorio",
            "i_predios.nome_predio AS nome",
            "g_localidades.descricao AS localidade",
            "i_correcoes_monetarias.competencia_avaliacao AS data_competencia",
            "i_correcoes_monetarias.valor_terreno AS terreno",
            "i_correcoes_monetarias.benfeitoria AS benfeitoria",
            "i_correcoes_monetarias.obras_em_andamento AS obras_em_andamento",
            "i_correcoes_monetarias.instalacoes AS instalacoes",
            "i_correcoes_monetarias.valor_edificacao AS edificacao",
            "i_correcoes_monetarias.valor_contabil AS total",
            "i_correcoes_monetarias.depreciacao_acumulada AS depreciacao_acumulada",
            "i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada AS valor_liquido"
          )
            .where(g_secretaria: g_secretaria)
            .joins(:g_localidade, :i_correcoes_monetarias, :g_cartorio)
            .joins(
              "INNER JOIN (
        SELECT i_predio_id, MAX(competencia_avaliacao) AS ultima_competencia_avaliacao
        FROM i_correcoes_monetarias
        WHERE deleted_at IS NULL
        GROUP BY i_predio_id
      ) AS ultima_correcao ON i_correcoes_monetarias.i_predio_id = ultima_correcao.i_predio_id AND
      i_correcoes_monetarias.competencia_avaliacao = ultima_correcao.ultima_competencia_avaliacao"
            )
        }
  scope :correcoes_originais_seduc, -> {
          joins(
            "INNER JOIN (
        SELECT i_predio_id, MAX(competencia_avaliacao) AS ultima_competencia_avaliacao
        FROM i_correcoes_monetarias
        WHERE deleted_at IS NULL
        GROUP BY i_predio_id
      ) AS ultima_correcao ON i_correcoes_monetarias.i_predio_id = ultima_correcao.i_predio_id AND
      i_correcoes_monetarias.competencia_avaliacao = ultima_correcao.ultima_competencia_avaliacao"
          )
            .joins(:g_localidade, :i_correcoes_monetarias, :g_cartorio)
            .where(g_secretaria: 1)
        }

  scope :correcao_monetaria, ->(g_secretaria) {
          select(
            "i_predios.id",
            "i_predios.matricula_imovel AS matricula",
            "g_cartorios.descricao AS cartorio",
            "i_predios.nome_predio AS nome",
            "g_localidades.descricao AS localidade",
            "i_correcoes_monetarias.competencia_avaliacao AS data_competencia",
            "i_correcoes_monetarias.valor_terreno AS terreno",
            "i_correcoes_monetarias.benfeitoria AS benfeitoria",
            "i_correcoes_monetarias.obras_em_andamento AS obras_em_andamento",
            "i_correcoes_monetarias.instalacoes AS instalacoes",
            "i_correcoes_monetarias.valor_edificacao AS edificacao",
            "i_correcoes_monetarias.valor_contabil AS total",
            "i_correcoes_monetarias.depreciacao_acumulada AS depreciacao_acumulada",
            "i_correcoes_monetarias.valor_contabil AS valor_liquido",
            "i_correcoes_monetarias.depreciacao_mes AS mes"
          )
            .where(g_secretaria: g_secretaria)
            .joins(:g_localidade, :i_correcoes_monetarias, :g_cartorio)
            .joins(
              "INNER JOIN (
          SELECT i_predio_id, MAX(competencia_avaliacao) AS ultima_competencia_avaliacao
          FROM i_correcoes_monetarias
          WHERE deleted_at IS NULL
          GROUP BY i_predio_id
        ) AS ultima_correcao ON i_correcoes_monetarias.i_predio_id = ultima_correcao.i_predio_id AND
        i_correcoes_monetarias.competencia_avaliacao = ultima_correcao.ultima_competencia_avaliacao"
            )
        }

  scope :tc16_analitico, ->() {
          select(
            "i_predios.id",
            "i_predios.matricula_imovel AS matricula",
            "g_cartorios.descricao AS cartorio",
            "i_predios.nome_predio AS nome",
            "g_localidades.descricao AS localidade",
            "i_correcoes_monetarias.competencia_avaliacao AS data_competencia",
            "i_correcoes_monetarias.valor_terreno AS terreno",
            "i_correcoes_monetarias.benfeitoria AS benfeitoria",
            "i_correcoes_monetarias.obras_em_andamento AS obras_em_andamento",
            "i_correcoes_monetarias.instalacoes AS instalacoes",
            "i_correcoes_monetarias.valor_edificacao AS edificacao",
            "i_correcoes_monetarias.valor_contabil AS total",
            "i_correcoes_monetarias.depreciacao_acumulada AS depreciacao_acumulada",
            "i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada AS valor_liquido"
          )
            .joins(:g_localidade, :i_correcoes_monetarias, :g_cartorio, :g_secretaria)
            .joins(
              "INNER JOIN (
              SELECT i_predio_id, MAX(competencia_avaliacao) AS ultima_competencia_avaliacao
              FROM i_correcoes_monetarias
              WHERE deleted_at IS NULL
              GROUP BY i_predio_id
            ) AS ultima_correcao ON i_correcoes_monetarias.i_predio_id = ultima_correcao.i_predio_id AND
            i_correcoes_monetarias.competencia_avaliacao = ultima_correcao.ultima_competencia_avaliacao"
            )
        }

  scope :tc16_sintetico, -> {
          select(
            "g_secretarias.descricao AS secretaria",
            "g_secretarias.sigla AS sigla",
            "SUM(i_correcoes_monetarias.valor_terreno) AS terreno",
            "SUM(i_correcoes_monetarias.valor_edificacao) AS edificacao",
            "SUM(i_correcoes_monetarias.benfeitoria) AS benfeitoria",
            "SUM(i_correcoes_monetarias.obras_em_andamento) AS total_obras_em_andamento",
            "SUM(i_correcoes_monetarias.instalacoes) AS total_instalacoes",
            "SUM(i_correcoes_monetarias.valor_contabil) AS total_contabil",
            "SUM(i_correcoes_monetarias.depreciacao_acumulada) AS total_depreciacao_acumulada",
            "SUM(i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada) AS total_valor_liquido"
          )
            .joins(:i_correcoes_monetarias, :g_secretaria)
            .joins(
              "INNER JOIN (
        SELECT i_predio_id, MAX(competencia_avaliacao) AS ultima_competencia_avaliacao
        FROM i_correcoes_monetarias
        WHERE deleted_at IS NULL
        GROUP BY i_predio_id
      ) AS ultima_correcao ON i_correcoes_monetarias.i_predio_id = ultima_correcao.i_predio_id AND
        i_correcoes_monetarias.competencia_avaliacao = ultima_correcao.ultima_competencia_avaliacao"
            )
        }

  private

  def length_codigo_inep
    # Se o campo for vazio.
    return true if self.codigo_inep.blank?

    # Valida o código INEP se ele é de 8 dígitos 
    unless self.codigo_inep.length == 8
      errors.add(:codigo_inep, 'Digite apenas números e deve conter 8 caracteres.')
    end
    
    # Não deve conter letras.
    unless self.codigo_inep.match?(/\A\d+\z/)
      errors.add(:codigo_inep, 'Não deve conter letras')
    end
    
    if errors.present?
      errors
      throw(:abort)
    end
  end
end
