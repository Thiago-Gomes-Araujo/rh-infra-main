class GEstado < ApplicationRecord
  belongs_to :g_pais
  has_many :g_municipios
  # Relacionamentos personalizados
  has_many :ctps_uf_pessoas, class_name: "GPessoa", foreign_key: "ctps_uf_id"
  has_many :identidade_uf_pessoas, class_name: "GPessoa", foreign_key: "identidade_uf_id"

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }
  validates :uf, presence: true, uniqueness: { scope: :deleted_at }

  [:descricao, :sigla].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    descricao
  end

  # Métdo utilizado para concatenar uf e descricao em uma string, (Form Pessoa em identidade_uf)
  def uf_descricao
    "#{uf} - #{descricao}"
  end
end
