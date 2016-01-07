class RemoveUpdatedAtFromStaffs < ActiveRecord::Migration
  def change
    remove_column :staffs, :updated_at, :datetime
  end
end
