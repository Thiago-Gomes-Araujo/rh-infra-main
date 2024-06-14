class IAditivo < ApplicationRecord
  belongs_to :i_acordo
  belongs_to :i_tipo_aditivo

  def valor=(valor)
    super valor = string_to_decimal(valor)
  end
end
