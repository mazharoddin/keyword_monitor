class CreateCrawResults < ActiveRecord::Migration
  def change
    create_table :craw_results do |t|
      t.string :status
      t.integer :position
      t.string :url
      t.references :keyword, index: true

      t.timestamps
    end
  end
end
