class AddImageToPotlocks < ActiveRecord::Migration
  def change
    add_column :potlocks, :image, :string
  end
end
