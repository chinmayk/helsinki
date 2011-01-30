class AddContentToPageSource < ActiveRecord::Migration
  def self.up
    add_column :page_sources, :content, :text
  end

  def self.down
    remove_column :page_sources, :content
  end
end
