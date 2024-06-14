class ITopicoInspecao < ApplicationRecord
  belongs_to :i_status_inspecao
  belongs_to :i_relacao_inspecao
  belongs_to :i_atividade_inspecao, optional: true
  belongs_to :i_inspecao

end
