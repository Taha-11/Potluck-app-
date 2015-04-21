class Comment < ActiveRecord::Base

  belongs_to :potlock
  belongs_to :user
end
