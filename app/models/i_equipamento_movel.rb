class IEquipamentoMovel < IEquipamento
  default_scope -> { where(i_familia_equipamento: 1) }
end
