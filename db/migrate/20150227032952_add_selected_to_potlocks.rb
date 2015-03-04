class AddSelectedToPotlocks < ActiveRecord::Migration
  def change
    add_column :potlocks, :selected, :boolean
  end
end
