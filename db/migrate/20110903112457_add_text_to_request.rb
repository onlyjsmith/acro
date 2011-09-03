class AddTextToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :text, :string
  end
end
