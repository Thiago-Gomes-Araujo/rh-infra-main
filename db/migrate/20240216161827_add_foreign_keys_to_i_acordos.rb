class AddForeignKeysToIAcordos < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_acordos, :i_nivel_acordo, foreing_key: true
    add_reference :i_acordos, :i_servico_acordo, foreing_key: true
    add_reference :i_acordos, :i_tipo_acordo, foreing_key: true
    add_reference :i_acordos, :i_tipo_fornecimento_execucao, foreing_key: true
  end

  def down
    remove_reference :i_acordos, :i_nivel_acordo, foreing_key: true
    remove_reference :i_acordos, :i_servico_acordo, foreing_key: true
    remove_reference :i_acordos, :i_tipo_acordo, foreing_key: true
    remove_reference :i_acordos, :i_tipo_fornecimento_execucao, foreing_key: true
  end
end
