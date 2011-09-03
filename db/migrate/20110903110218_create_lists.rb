class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :acronym_id
      t.string :title

      t.timestamps
    end
  end
end
