class AddKanaFromStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :kana, :string
  end
end
