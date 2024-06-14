class INotificacao < ApplicationRecord
  has_many :i_medicoes
  belongs_to :i_status_notificacao
  belongs_to :i_acordo

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  [:descricao, :motivo_notificacao].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def to_s
    descricao
  end
end
