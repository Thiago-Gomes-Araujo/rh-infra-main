class IContaContabil < ApplicationRecord
  has_many :i_predios

  validates :codigo, presence: true, uniqueness: { scope: :deleted_at }
  validates :tipo_consolidacao, presence: true
  validates :natureza, presence: true

  STRINGS_TO_UPCASE_AND_STRIP = [:descricao, :tipo_consolidacao, :natureza]
  STRINGS_TO_UPCASE_AND_STRIP.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def codigo_descricao
    "#{codigo} - #{descricao}"
  end

  def to_s
    codigo
  end
end
