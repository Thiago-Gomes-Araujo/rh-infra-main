class GPais < ApplicationRecord
  has_many :g_estados
  has_one :g_nacionalidade

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }
  validates :sigla, presence: true, uniqueness: { scope: :deleted_at }

  [:descricao, :sigla].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    descricao
  end
end
