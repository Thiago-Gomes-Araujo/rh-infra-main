class AddNewAttributesToExtensoes < ActiveRecord::Migration[7.0]
  def up
    add_column :i_extensoes, :latitude, :string
    add_column :i_extensoes, :longitude, :string
    add_reference :i_extensoes, :g_localidade, foreign_key: true
    add_reference :i_extensoes, :i_predio_situacao, foreing_key: true
  end

  def down
    remove_column :i_extensoes, :latitude, :string
    remove_column :i_extensoes, :longitude, :string
    remove_reference :i_extensoes, :g_localidade, foreign_key: true
    remove_reference :i_extensoes, :i_predio_situacao, foreing_key: true
  end
end
