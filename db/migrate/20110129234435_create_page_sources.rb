class CreatePageSources < ActiveRecord::Migration
  def self.up
    create_table :page_sources do |t|
      t.string :url
      t.string :links_path
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :page_sources
  end
end
