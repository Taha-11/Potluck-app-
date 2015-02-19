class CreatePotlocks < ActiveRecord::Migration
  def change
    create_table :potlocks do |t|
      t.string :create
      t.string :due_date
      t.string :listing_items

      t.timestamps null: false
    end
  end
end
