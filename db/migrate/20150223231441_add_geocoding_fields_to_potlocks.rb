class AddGeocodingFieldsToPotlocks < ActiveRecord::Migration
  def change
    add_column :potlocks, :address, :string
    add_column :potlocks, :longitude, :float
    add_column :potlocks, :latitude, :float
  end
end
