class AddUserToPotlock < ActiveRecord::Migration
  def change
    add_reference :potlocks, :user, index: true
    add_foreign_key :potlocks, :users
  end
end
