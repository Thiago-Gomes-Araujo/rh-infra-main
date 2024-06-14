class AddTiposInspecoesToInspecoes < ActiveRecord::Migration[7.0]
  def up
    add_reference :i_inspecoes, :i_tipo_inspecao, foreing_key: true
  end

  def down
    remove_reference :i_inspecoes, :i_tipo_inspecao, foreing_key: true
  end
end
