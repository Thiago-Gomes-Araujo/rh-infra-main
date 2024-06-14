class IMedicao < ApplicationRecord
  belongs_to :i_acordo
  belongs_to :i_notificacao
  belongs_to :i_fiscal
  has_many :i_orcamentos
  before_update :clear_data_termo_provisorio

  def to_s
    i_acordo
  end

  DECIMAL_VALUES = [:valor, :percentual_contratante, :percentual_fiscal]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val)
    end
  end

  def clear_data_termo_provisorio
    unless termo_provisorio?
      self.data_termo_provisorio = nil
    end
  end
end
