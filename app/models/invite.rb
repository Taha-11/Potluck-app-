class Invite < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :guest, :class_name => "User", :foreign_key => :guest_id
  belongs_to :potlock


end
