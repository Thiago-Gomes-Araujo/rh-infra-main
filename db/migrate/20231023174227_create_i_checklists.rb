class CreateIChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :i_checklists do |t|
      t.references :i_predio, null: false, foreign_key: true
      t.date :data_checklist
      t.boolean :bic_ficha_cadastral
      t.boolean :croqui
      t.boolean :memorial_descritivo
      t.boolean :certidao_narrativa_informativa
      t.boolean :certidao_valor_venal
      t.boolean :mapa_localizacao
      t.boolean :licenca_operacao_provisoria
      t.boolean :termo_doacao
      t.boolean :termo_cessao_uso_anuencia
      t.boolean :projeto_arquitetonico
      t.boolean :alvara_funcionamento
      t.boolean :alvara_sanitario
      t.boolean :projeto_acessibilidade
      t.boolean :laudo_tecnico_avaliacao_imoveis
      t.boolean :reforma_adequacao_ultimos_dois_anos
      t.string :processo_sei
      t.string :observacao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
