class Item < ActiveRecord::Base
  belongs_to :potlock
  belongs_to :user
end
