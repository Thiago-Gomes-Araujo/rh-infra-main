class AddIModalidadeLicitacaoToIAcordo < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_acordos, :i_modalidade_licitacao, foreing_key: true
  end

  def down
    remove_reference :i_acordos, :i_modalidade_licitacao, foreing_key: true
  end
end
