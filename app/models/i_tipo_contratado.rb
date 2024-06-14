class ITipoContratado < ApplicationRecord
  has_many :i_contratados

  def to_s
    descricao
  end
end
