class RenameLinesItemsToLineTimes < ActiveRecord::Migration
  def change
    rename_table :lines_items, :line_items
  end
end
