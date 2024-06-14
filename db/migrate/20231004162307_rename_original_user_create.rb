class RenameOriginalUserCreate < ActiveRecord::Migration[7.0]
  def change
    tables = ActiveRecord::Base.connection.data_sources

    tables.each do |table|
      if column_exists?(table, :original_user_create)
        rename_column table, :original_user_create, :created_by
      end
    end
  end
end
