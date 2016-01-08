class CreateAttachedFiles < ActiveRecord::Migration
  def change
    create_table :attached_files do |t|
      t.string :name
      t.binary :data
      t.timestamps
    end
  end
end
