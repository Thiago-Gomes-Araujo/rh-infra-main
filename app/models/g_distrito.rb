class GDistrito < ApplicationRecord
  belongs_to :g_municipio
  has_many :g_localidades

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }
  validates :codigo_ibge, presence: true

  [:descricao].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    descricao
  end
end
