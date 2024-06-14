class EEscola < IPredio
  default_scope -> { where(i_tipo_predio_id: 3) }
end