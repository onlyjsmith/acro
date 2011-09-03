class CreateAcronyms < ActiveRecord::Migration
  def change
    create_table :acronyms do |t|
      t.string :abbreviation
      t.string :definition

      t.timestamps
    end
  end
end
