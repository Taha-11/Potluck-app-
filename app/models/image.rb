class Image < ActiveRecord::Base
    validates :image, presence: true
    mount_uploader :image, ImageUploader
    belongs_to :user, :foreign_key => 'user_id'
  
end
