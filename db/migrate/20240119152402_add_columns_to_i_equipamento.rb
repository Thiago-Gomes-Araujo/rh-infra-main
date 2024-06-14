class AddColumnsToIEquipamento < ActiveRecord::Migration[7.0]
  def up
    add_column :i_equipamentos, :descricao_sintetica, :string
    add_column :i_equipamentos, :descricao_analitica, :string
    add_column :i_equipamentos, :data_ingresso, :date
    add_column :i_equipamentos, :descricao_documento_habil, :string
    add_column :i_equipamentos, :numero_sei, :string
    add_column :i_equipamentos, :numero_tombamento, :string
    add_column :i_equipamentos, :numero_empenho, :string
    add_column :i_equipamentos, :numero_nfe, :string
    add_reference :i_equipamentos, :i_marca, foreign_key: true
    add_reference :i_equipamentos, :i_classificacao, foreign_key: true
    add_reference :i_equipamentos, :i_estado_equipamento, foreign_key: true
    add_reference :i_equipamentos, :i_forma_ingresso, foreign_key: true
    add_reference :i_equipamentos, :g_lista_organizacional, foreign_key: true
    add_column :i_equipamentos, :valor_aquisicao, :decimal, precision: 17, scale: 2
    add_column :i_equipamentos, :depreciacao, :boolean
    add_column :i_equipamentos, :valor_percentual, :integer
    add_column :i_equipamentos, :valor_util_meses, :integer
    add_column :i_equipamentos, :numero_serie, :string
    add_column :i_equipamentos, :modelo, :string
    add_column :i_equipamentos, :numero_termo_garantia, :integer
    add_column :i_equipamentos, :inicio_vigencia_termo_garantia, :date
    add_column :i_equipamentos, :fim_vigencia_termo_garantia, :date
    add_column :i_equipamentos, :observacao, :string
    add_column :i_equipamentos, :veiculo_especial, :boolean
    add_column :i_equipamentos, :ano_fabricacao, :integer
    add_column :i_equipamentos, :ano_modelo, :integer
    add_column :i_equipamentos, :chassi, :string
    add_column :i_equipamentos, :cor, :string
    add_column :i_equipamentos, :classificacao_placa, :string
    add_column :i_equipamentos, :numero_placa, :string
    add_column :i_equipamentos, :renavam, :string
  end

  def down
    remove_column :i_equipamentos, :descricao_sintetica, :string
    remove_column :i_equipamentos, :descricao_analitica, :string
    remove_column :i_equipamentos, :data_ingresso, :date
    remove_column :i_equipamentos, :descricao_documento_habil, :string
    remove_column :i_equipamentos, :numero_sei, :string
    remove_column :i_equipamentos, :numero_tombamento, :string
    remove_column :i_equipamentos, :numero_empenho, :string
    remove_column :i_equipamentos, :numero_nfe, :string
    remove_reference :i_equipamentos, :i_marca, foreign_key: true
    remove_reference :i_equipamentos, :i_classificacao, foreign_key: true
    remove_reference :i_equipamentos, :i_estado_equipamento, foreign_key: true
    remove_reference :i_equipamentos, :i_forma_ingresso, foreign_key: true
    remove_reference :i_equipamentos, :g_lista_organizacional, foreign_key: true
    remove_column :i_equipamentos, :valor_aquisicao, :decimal, precision: 17, scale: 2
    remove_column :i_equipamentos, :depreciacao, :boolean
    remove_column :i_equipamentos, :valor_percentual, :integer
    remove_column :i_equipamentos, :valor_util_meses, :integer
    remove_column :i_equipamentos, :numero_serie, :string
    remove_column :i_equipamentos, :modelo, :string
    remove_column :i_equipamentos, :numero_termo_garantia, :integer
    remove_column :i_equipamentos, :inicio_vigencia_termo_garantia, :date
    remove_column :i_equipamentos, :fim_vigencia_termo_garantia, :date
    remove_column :i_equipamentos, :observacao, :string
    remove_column :i_equipamentos, :veiculo_especial, :boolean
    remove_column :i_equipamentos, :ano_fabricacao, :integer
    remove_column :i_equipamentos, :ano_modelo, :integer
    remove_column :i_equipamentos, :chassi, :string
    remove_column :i_equipamentos, :cor, :string
    remove_column :i_equipamentos, :classificacao_placa, :string
    remove_column :i_equipamentos, :numero_placa, :string
    remove_column :i_equipamentos, :renavam, :string
  end
end
