class IRelacaoInspecao < ApplicationRecord
  belongs_to :i_tipo_item_inspecao
  belongs_to :i_item_inspecao
  belongs_to :i_tipo_inspecao

  has_many :i_topicos_inspecoes

  #validar pelo item para que ele não seja duplicado independente do tipo de inspecao
  validates :i_item_inspecao, presence: true, uniqueness: { scope: :deleted_at }

  #Concatenação para aparecer no select o tipo do item e o item 
  def to_s
    "#{i_tipo_item_inspecao} - #{i_item_inspecao}"
  end
  
end
