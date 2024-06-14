module StringToDecimalPreciso
  extend ActiveSupport::Concern

  included do
    default_scope { where(deleted_at: nil) }
  end

  class_methods do
    def decimal_values(*attrs)
      attrs.each do |attr|
        define_method("#{attr}=") do |val|
          super(val.is_a?(String) ? string_to_decimal_quatro_casas(val) : val)
        end
      end
    end
  end

  private

  def string_to_decimal_quatro_casas(valor)
    valor.gsub(/[.,]/, "").to_f / 10000
  end
end
