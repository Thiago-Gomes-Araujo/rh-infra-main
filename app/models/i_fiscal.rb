class IFiscal < ApplicationRecord
  belongs_to :i_portaria
  has_many :i_acordos
  has_many :i_medicoes

  validates :descricao, presence: true, uniqueness: { scope: :i_portaria_id, conditions: -> { where(deleted_at: nil) } }
  validates :area_atuacao, presence: true

  STRINGS_TO_UPCASE_AND_STRIP = [:descricao, :area_atuacao]
  STRINGS_TO_UPCASE_AND_STRIP.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def descricao=(descricao)
    super descricao = descricao.upcase.strip
  end

  def fiscal_portaria
    "#{descricao} - #{i_portaria.descricao}"
  end

  def to_s
    descricao
  end
end
