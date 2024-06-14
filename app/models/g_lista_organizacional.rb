class GListaOrganizacional < ApplicationRecord
  has_many :i_equipamentos

  validates :sigla, presence: true
  validates :descricao, presence: true

  [:descricao, :sigla].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    descricao
  end

  def sigla_descricao
    "#{sigla} " + "-" + " #{descricao}"
  end
end
