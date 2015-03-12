class AddColumnToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :potlock_id, :integer
  end
end
