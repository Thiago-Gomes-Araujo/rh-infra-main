class GSistema < ApplicationRecord
  validates :letra, presence: true, uniqueness: { scope: :deleted_at }, length: { is: 1 }, format: { with: /\A[a-zA-Z]+\z/, message: "permite somente permite letras" }
  validates :nome, presence: true, uniqueness: { scope: :deleted_at }

  [:letra, :nome].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    nome
  end
end
