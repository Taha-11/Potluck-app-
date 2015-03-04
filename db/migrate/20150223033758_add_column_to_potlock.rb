class AddColumnToPotlock < ActiveRecord::Migration
  def change
    add_column :potlocks, :meal, :string
  end
end
