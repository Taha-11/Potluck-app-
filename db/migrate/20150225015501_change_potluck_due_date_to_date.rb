class ChangePotluckDueDateToDate < ActiveRecord::Migration
  def change
    remove_column :potlocks, :due_date, :string
    add_column :potlocks, :due_date, :datetime
  end
end
