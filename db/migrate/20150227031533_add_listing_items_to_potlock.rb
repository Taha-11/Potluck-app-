class AddListingItemsToPotlock < ActiveRecord::Migration
  def change
    add_column :potlocks, :listing_items, :text
  end
end
