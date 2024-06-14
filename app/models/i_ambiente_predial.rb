class IAmbientePredial < ApplicationRecord
  belongs_to :i_tipo_ambiente_predial
  belongs_to :i_bloco
  has_many :i_equipamentos

  validates :descricao, presence: true
  validates :comprimento, presence: true
  validates :largura, presence: true

  before_save :calcular_metros_quadrados

  DECIMAL_VALUES = [:comprimento, :largura]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val) if val.class == String
    end
  end

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end

  def calcular_metros_quadrados
    self.metros_quadrados = (self.comprimento.to_f * self.largura.to_f)
  end
end
