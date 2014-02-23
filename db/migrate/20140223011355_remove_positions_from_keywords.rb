class RemovePositionsFromKeywords < ActiveRecord::Migration
  def change
    remove_column :keywords, :positions, :text
  end
end
