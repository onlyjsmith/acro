class RemoveAcronymIdFromLists < ActiveRecord::Migration
  def up
    remove_column :lists, :acronym_id
  end

  def down
  end
end