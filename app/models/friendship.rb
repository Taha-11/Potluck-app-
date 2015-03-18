class Friendship < ActiveRecord::Base

  belongs_to :user, :foreign_key => :user_id
  belongs_to :friend, :class_name => 'User', :foreign_key => :friend_id
  belongs_to :inverse_friend, :foreign_key => :friend_id

  validates :friend_id, uniqueness: {scope: :user_id}
  

end
