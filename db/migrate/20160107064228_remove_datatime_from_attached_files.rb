class RemoveDatatimeFromAttachedFiles < ActiveRecord::Migration
  def change
    remove_column :attached_files, :created_at, :datetime
    remove_column :attached_files, :updated_at, :datetime
  end
end
