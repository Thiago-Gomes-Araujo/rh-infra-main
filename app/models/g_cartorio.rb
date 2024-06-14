class GCartorio < ApplicationRecord
  belongs_to :g_municipio
  has_many :i_predios
  has_many :i_acordos

  validates :cnpj, presence: true, uniqueness: { scope: :deleted_at }
  validates :descricao, presence: true

  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def to_s
    descricao
  end

  def cnpj=(cnpj)
    super cnpj = cnpj.gsub(/[.\/-]/, "").strip
  end
end
