class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
        geocoded_by :address
        after_validation :geocode 

         #validates :user_id, presence: true, :uniqueness => true
          #validate :images_limit
          validates :first_name, :email, presence: true

          devise :database_authenticatable, :registerable, :omniauthable,
             :recoverable, :rememberable, :trackable, :validatable
          devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :trackable, :validatable
      
         has_many :images
         has_many :potlocks
         has_many  :items
         has_many :friendships
         has_many :invites 
         has_many :friends, :through => :friendships
         has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
         has_many :inverse_friends, :through => :inverse_friendships, :source => :user


         
 
  
     



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
    image = omniauth data["info"]["image"]
     user = User.create(provider: :facebook,
                         uid: omniauth_data["uid"],
                         email: omniauth_data["info"]["email"],
                         image: image[1],
                         first_name: name[0],
                         oauth_token: omniauth_data["token"],
                         oauth_expires_at: Time.at(omniauth_data["credentials"]["expires_at"]),
                         omniauth_raw_data: omniauth_data)


   
                end
      user
  end 
       
end 



