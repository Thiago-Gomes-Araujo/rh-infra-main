class ERegimento < ApplicationRecord
  belongs_to :i_predio

  validates :numero_homologacao, presence: true, uniqueness: { scope: :deleted_at }
  validates :portaria, presence: true, uniqueness: { scope: :deleted_at }
  validates :numero_doe, presence: true
end
