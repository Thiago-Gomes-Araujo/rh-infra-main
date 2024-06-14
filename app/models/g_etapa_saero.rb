class GEtapaSaero < ApplicationRecord
  def to_s
    descricao
  end

  DECIMAL_VALUES = [:indice_lp, :indice_mt]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val)
    end
  end
end
