class IAcordo < ApplicationRecord
  belongs_to :i_predio, optional: true
  belongs_to :i_patrocinador
  belongs_to :i_categoria_acordo
  belongs_to :i_status_acordo
  belongs_to :g_cartorio, optional: true
  belongs_to :i_contratado
  belongs_to :i_fiscal, optional: true
  belongs_to :i_nivel_acordo
  belongs_to :i_servico_acordo
  belongs_to :i_tipo_acordo
  belongs_to :i_tipo_fornecimento_execucao
  belongs_to :i_modalidade_licitacao
  has_many :i_medicoes
  has_many :i_orcamentos
  has_many :i_valores_empenhados_acordos
  has_many :i_notificacoes

  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def to_s
    descricao
  end

  def acordo_objeto
    "#{descricao}" + " - " + "#{objeto}"
  end

  DECIMAL_VALUES = [:valor, :valor_aditivo]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val)
    end
  end
end
