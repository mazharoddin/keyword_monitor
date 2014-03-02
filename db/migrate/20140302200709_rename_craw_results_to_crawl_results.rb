class RenameCrawResultsToCrawlResults < ActiveRecord::Migration
  def change
    rename_table :craw_results, :crawl_results
  end
end
