class EAtoNormativo < ApplicationRecord
  belongs_to :i_predio
  belongs_to :e_tipo_ato_normativo
  belongs_to :e_normatizacao

  def descricao=(descricao)
    super descricao.upcase.strip
  end

  def to_s
    descricao
  end
end
