class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
        geocoded_by :address
        after_validation :geocode 

          # validates_uniqueness_of :user_id, :scope => :friend_id
          # validates :first_name, :email, presence: true
          # validates :friend_id, :uniqueness => {:scope => :id }
          


          devise :database_authenticatable, :registerable, :omniauthable,
             :recoverable, :rememberable, :trackable, :validatable
          devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :trackable, :validatable
         has_many :comments, through: :potlocks
         has_many :images
         has_many :potlocks, :dependent => :destroy
         has_many :items
         has_many :friendships
         has_many :invites 
         has_many :friends, :through => :friendships
         has_many :guests, :through => :invites
         has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id",:dependent => :destroy
         has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :dependent => :destroy
         has_many :inverse_invites,  :class_name => "Invite", :foreign_key => "guest_id", :dependent => :destroy
         has_many :inverse_guests, :through => :inverse_invites, :source => :user, :dependent => :destroy
        
  #   def added_friends
  #   inverse_friends.joins(:friendships).where("friendships.friend_id = users.id and friendships.user_id = users.id").all
  # end

  
      def notification_count
        array = []
        self.inverse_friends.each do |i|
          array << i if !self.friends.exists?(i)
        end
        return array.count
      end
     
      def full_name
      "#{first_name} #{last_name}"
      end

      # def search_by_full_name(search_term)
      #   where('full_name like?', "%#{search_term}"%)
      # end 


      def image
        images.order('created_at DESC').first
      end
serialize :omniauth_data  

def email_required? #bypasses devise email required validation(already with facebook)
   false
 end 
  def password_required?
   provider.nil?      #bypasses devise password required validation(already with facebook)
 end  



def self.find_or_create_from_facebook(omniauth_data)
 
  user = User.where(provider: :facebook, uid: omniauth_data["uid"]).first
   unless user
    name = omniauth_data["info"]["name"].split
    image = omniauth_data["info"]["image"]
     user = User.create(provider: :facebook,
                         uid: omniauth_data["uid"],
                         email: omniauth_data["info"]["email"],
                         image: image[0],
                         first_name: name[0],
                         last_name: name[1],
                         oauth_token: omniauth_data["token"],
                         oauth_expires_at: Time.at(omniauth_data["credentials"]["expires_at"]))
                         



   
                end
      user
  end 
       
end 



