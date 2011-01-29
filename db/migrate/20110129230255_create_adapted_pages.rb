class CreateAdaptedPages < ActiveRecord::Migration
  def self.up
    create_table :adapted_pages do |t|
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :adapted_pages
  end
end
