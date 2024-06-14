class AddITipoAditivoToAditivo < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_aditivos, :i_tipo_aditivo, foreing_key: true
  end

  def down
    remove_reference :i_aditivos, :i_tipo_aditivo, foreing_key: true
  end
end