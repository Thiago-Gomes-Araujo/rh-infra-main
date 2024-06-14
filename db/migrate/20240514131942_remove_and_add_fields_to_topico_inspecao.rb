class RemoveAndAddFieldsToTopicoInspecao < ActiveRecord::Migration[7.0]
  def up

    remove_reference :i_topicos_inspecoes, :i_tipo_item_inspecao, null: false, foreign_key: true
    remove_reference :i_topicos_inspecoes, :i_item_inspecao, null: false, foreign_key: true
    
    add_reference :i_topicos_inspecoes, :i_relacao_inspecao, null: false, foreign_key: true
  end
  def down

    add_reference :i_topicos_inspecoes, :i_tipo_item_inspecao, null: false, foreign_key: true
    add_reference :i_topicos_inspecoes, :i_item_inspecao, null: false, foreign_key: true
    
    remove_reference :i_topicos_inspecoes, :i_relacao_inspecao, null: false, foreign_key: true
  end
end
