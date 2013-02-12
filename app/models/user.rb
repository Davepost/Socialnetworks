class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  
  has_many :groups
  has_many :friends, :through => :groups
  
	def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    	user.provider = auth.provider
   		user.uid = auth.uid
    	user.name = auth.info.name
      user.photo = auth.info.image
    	user.oauth_token = auth.credentials.token
   	 	user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    	user.save!
  	end
	end
end
