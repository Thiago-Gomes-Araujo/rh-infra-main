class GRaca < ApplicationRecord
  has_many :g_pessoas
  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  [:descricao].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    descricao
  end
end
