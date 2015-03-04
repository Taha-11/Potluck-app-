class RemoveColumnsFromUsersTabel < ActiveRecord::Migration
  def change
     remove_column :users, :facebook_consumer
    remove_column :users, :facebook_consumer_secret
    remove_column :users, :omniauth_raw_data

  end
end
