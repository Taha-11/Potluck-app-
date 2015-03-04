class AddOmniauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_consumer, :string
    add_column :users, :facebook_consumer_secret, :string
    add_column :users, :omniauth_raw_data, :text

    add_index :users, [:provider, :uid]
  end
end
