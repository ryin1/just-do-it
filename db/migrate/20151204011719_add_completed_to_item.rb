class AddCompletedToItem < ActiveRecord::Migration
  def change
    add_column :items, :done, :boolean
  end
end
