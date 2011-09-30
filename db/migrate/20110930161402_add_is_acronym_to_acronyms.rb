class AddIsAcronymToAcronyms < ActiveRecord::Migration
  def change
    add_column :acronyms, :is_acronym, :boolean
  end
end
