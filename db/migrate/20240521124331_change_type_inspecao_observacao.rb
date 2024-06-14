class ChangeTypeInspecaoObservacao < ActiveRecord::Migration[7.0]
  def up
    change_column :i_inspecoes, :observacao, :text
  end

  def down
    change_column :i_inspecoes, :observacao, :string
  end
end
