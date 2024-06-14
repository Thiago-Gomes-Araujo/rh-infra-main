class AddObrasEInstalacoesToICorrecoesMonetarias < ActiveRecord::Migration[7.0]
  def up
    add_column :i_correcoes_monetarias, :obras_em_andamento, :decimal, precision: 17, scale: 2
    add_column :i_correcoes_monetarias, :data_obras_em_andamento, :date
    add_column :i_correcoes_monetarias, :instalacoes, :decimal, precision: 17, scale: 2
    add_column :i_correcoes_monetarias, :data_instalacoes, :date
  end

  def down
    remove_column :i_correcoes_monetarias, :obras_em_andamento, :decimal, precision: 17, scale: 2
    remove_column :i_correcoes_monetarias, :data_obras_em_andamento, :date
    remove_column :i_correcoes_monetarias, :instalacoes, :decimal, precision: 17, scale: 2
    remove_column :i_correcoes_monetarias, :data_instalacoes, :date
  end
end
