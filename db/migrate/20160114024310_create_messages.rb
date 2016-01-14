class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :division_cd
      t.references :attached_file
      t.timestamps
    end
  end
end
