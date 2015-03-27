class Friendship < ActiveRecord::Base

  belongs_to :user, :foreign_key => :user_id
  belongs_to :friend, :class_name => 'User', :foreign_key => :friend_id
  belongs_to :inverse_friend, :foreign_key => :inverse_friend_id
  self.per_page = 6
  validates :friend_id, uniqueness: {scope: :user_id}

  before_create :same_dude?


  def same_dude?
    if self.friend_id != self.user_id
      return true
    end
      return false
  end
end
