class IEquipamentoVeiculo < IEquipamento
  default_scope -> { where(i_familia_equipamento: 2, quantidade: 1, i_tipo_equipamento: 7) }

  belongs_to :g_municipio_placa, class_name: "GMunicipio", foreign_key: "g_municipio_placa_id", optional: true

  validates :ano_fabricacao, presence: true
  validates :ano_modelo, presence: true
  validates :chassi, presence: true, uniqueness: { scope: :deleted_at }
  validates :cor, presence: true
  validates :classificacao_placa, presence: true
  validates :numero_placa, presence: true, uniqueness: { scope: :deleted_at }
  validates :renavam, presence: true, uniqueness: { scope: :deleted_at }
  validates :g_municipio_placa, presence: true
end
