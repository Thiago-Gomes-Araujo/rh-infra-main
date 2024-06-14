class ICorrecaoMonetaria < ApplicationRecord
  belongs_to :i_predio

  validates :data_avaliacao, presence: true
  validates :valor_edificacao, presence: true
  validates :valor_terreno, presence: true
  validates :vida_util_anos, presence: true
  validates :percentual_residual, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :competencia_avaliacao, presence: true, uniqueness: { scope: :i_predio, conditions: -> { where(deleted_at: nil) } }
  validate :custom_validates

  before_save :correcao_monetaria_calculos

  DECIMAL_VALUES = [:valor_edificacao, :valor_terreno, :benfeitoria, :obras_em_andamento, :instalacoes]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val) if val.class == String
    end
  end

  def percentual_residual=(percentual_residual)
    super percentual_residual = percentual_residual.gsub(/[%]/, "").strip
  end

  def custom_validates
    if competencia_avaliacao.present? && data_avaliacao.present?
      if competencia_avaliacao.year < data_avaliacao.year ||
         (competencia_avaliacao.year == data_avaliacao.year && competencia_avaliacao.month <= data_avaliacao.month)
        errors.add(:competencia_avaliacao, "não pode ser no mesmo mês/ano ou anterior à data de avaliação")
        errors.add(:data_avaliacao, "não pode ser no mesmo mês/ano ou posterior à competência da avaliação")
      end
    end

    if data_benfeitoria.present? and data_benfeitoria >= Time.now
      errors.add(:data_benfeitoria, "deve ser anterior à data atual")
    end
  end

  def correcao_monetaria_calculos
    # Cálculo de meses entre as datas informadas, com arredondamento para casos de menos de um mês e valores quebrados
    if competencia_avaliacao.present? and data_avaliacao.present?
      data_inicial = self.data_avaliacao
      data_final = self.competencia_avaliacao

      # Calcule a diferença em meses entre as datas
      diferenca_em_meses = (data_final.year * 12 + data_final.month) - (data_inicial.year * 12 + data_inicial.month)

      # Se a diferença for menor que 1 mês, retorne 1 mês
      diferenca_em_meses = 1 if diferenca_em_meses < 1

      self.meses = diferenca_em_meses.round
    end

    # Cálculo de meses por ano
    self.vida_util_meses = self.vida_util_anos * 12

    # Cálculo do valor_residual
    self.valor_residual = (self.valor_edificacao.to_f + self.benfeitoria.to_f) * (self.percentual_residual.to_f / 100)

    # Cálculo do valor_depreciavel
    self.valor_depreciavel = ((self.valor_edificacao.to_f + benfeitoria.to_f) - self.valor_residual.to_f) + (self.obras_em_andamento.to_f + self.instalacoes.to_f)

    # Cálculo da depreciacao_mes
    self.depreciacao_mes = (self.valor_depreciavel.to_f / self.vida_util_meses).round(2)

    # Cálculo da depreciacao_acumulada
    self.depreciacao_acumulada = self.depreciacao_mes.to_f * self.meses.to_i

    # Cálculo do valor_contabil
    self.valor_contabil = valor_edificacao.to_f + valor_terreno.to_f + benfeitoria.to_f + obras_em_andamento.to_f + instalacoes.to_f
  end 

  def self.calcula_depreciacao_mensal g_secretaria, data_competencia
    depreciacao_acumulada = []

    # Faz a consulta para buscar as atualizações com a última data de competencia_avaliacao gerada.
    i_correcao_monetarias = ICorrecaoMonetaria.select(:id, :i_predio_id, :data_avaliacao, :depreciacao_mes).joins(:i_predio).where(i_predios: {g_secretaria_id: g_secretaria})
    .joins("
      INNER JOIN (
        SELECT i_predio_id, MAX(competencia_avaliacao) AS ultima_competencia_avaliacao
        FROM i_correcoes_monetarias
        WHERE deleted_at IS NULL
        GROUP BY id, i_predio_id ) 
        AS ultima_correcao ON i_correcoes_monetarias.i_predio_id = ultima_correcao.i_predio_id AND
        i_correcoes_monetarias.competencia_avaliacao = ultima_correcao.ultima_competencia_avaliacao"
    ).distinct

    # Faz o loop criando um array de objeto com o id do prédio e o valor atualizado da correção.
    i_correcao_monetarias.find_each do |i_correcao_monetaria|
      depreciacao_acumulada << { id: i_correcao_monetaria.i_predio_id, correcao_monetaria: calc_deprenciacao(i_correcao_monetaria.data_avaliacao, i_correcao_monetaria.depreciacao_mes, data_competencia)}
    end
    
    # Retorna o valor.
    depreciacao_acumulada
  end

  private

  def self.calc_deprenciacao data_avaliacao, depreciacao_mes, data_competencia
    # Calcule a diferença em meses entre as datas
    diferenca_em_meses = (data_competencia.year * 12 + data_competencia.month) - (data_avaliacao.year * 12 + data_avaliacao.month)

    # Se a diferença for menor que 1 mês, retorne 1 mês
    diferenca_em_meses = 1 if diferenca_em_meses < 1
    
    # Valor de depreciação atualizado.
    depreciacao_acumulada = (depreciacao_mes.to_f * diferenca_em_meses.round.to_i)
  end
end
