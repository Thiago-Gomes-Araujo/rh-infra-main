class IEquipamentoSoftware < IEquipamento
  default_scope -> { where(i_familia_equipamento: 3) }
end
