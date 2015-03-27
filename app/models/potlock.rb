class Potlock < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  has_many :items, :dependent => :destroy
  has_many :invites, :dependent => :destroy
  has_many :comments 
end
