class GCre < ApplicationRecord
  belongs_to :g_secretaria
  belongs_to :g_municipio
  belongs_to :g_tipologia_cre
  has_many :i_predios
  has_many :users

  def to_s
    descricao
  end
end
