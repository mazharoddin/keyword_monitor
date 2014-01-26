class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :name
      t.text :positions
      t.references :project, index: true

      t.timestamps
    end
  end
end
