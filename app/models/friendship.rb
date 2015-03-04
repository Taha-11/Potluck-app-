class Friendship < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :friend, :class_name => 'User', :foreign_key => :friend_id

  
  def self.search(name)
    if name
      joins(:friends).where('friends.first_name iLIKE ?', "%#{name}%")
    else
      find(:all)
    end
  end


end
