class ChangeCepToCep < ActiveRecord::Migration[7.0]
  def up
    rename_column :i_predios, :CEP, :cep
  end

  def down
    rename_column :i_predios, :cep, :CEP
  end
end
