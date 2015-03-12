class CreateInverseFriendships < ActiveRecord::Migration
  def change
    create_table :inverse_friendships do |t|

      t.timestamps null: false
    end
  end
end
