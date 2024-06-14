class IEquipamento < ApplicationRecord
  belongs_to :i_tipo_equipamento
  belongs_to :i_ambiente_predial
  belongs_to :g_lista_organizacional
  belongs_to :i_classificacao
  belongs_to :i_estado_equipamento
  belongs_to :i_forma_ingresso
  belongs_to :i_marca
  belongs_to :i_fornecedor, class_name: "IContratado", foreign_key: "i_fornecedor_id"
  belongs_to :i_seguradora, class_name: "IContratado", foreign_key: "i_seguradora_id"
  belongs_to :i_familia_equipamento
  
  
  
  def descricao=(descricao)
    super descricao.upcase.strip
  end
  
  def numero_sei=(numero_sei)
    super numero_sei.gsub(/[.\/-]/, "").strip
  end
  
  def to_s
    descricao
  end
  
end
