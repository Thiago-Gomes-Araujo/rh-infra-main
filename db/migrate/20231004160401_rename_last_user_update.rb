class RenameLastUserUpdate < ActiveRecord::Migration[7.0]
  def change
    tables = ActiveRecord::Base.connection.data_sources

    tables.each do |table|
      if column_exists?(table, :last_user_update)
        rename_column table, :last_user_update, :updated_by
      end
    end
  end
end
