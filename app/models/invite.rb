class Invite < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :guest, :class_name => 'User', :foreign_key => :guest_id
  belongs_to :inverse_guest, :foreign_key => :inverse_guest_id
  belongs_to :potlock, :foreign_key => :potlock_id


  def self.find_potlock(user_id, guest_id)
    return where("user_id = #{user_id} AND guest_id = #{guest_id}")[0] 
  end

  # def self.find_potlock(user_id)
  #   return where("user_id = #{user_id}")[0] 
  # end




end
