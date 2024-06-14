class AddDeletedAtToActiveStorageAttachments < ActiveRecord::Migration[7.0]
  def up
    add_column :active_storage_attachments, :deleted_at, :datetime
  end

  def down
    remove_column :active_storage_attachments, :deleted_at, :datetime
  end
end
