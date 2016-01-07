class RemoveCreatedAtFromStaffs < ActiveRecord::Migration
  def change
    remove_column :staffs, :created_at, :datetime
  end
end
