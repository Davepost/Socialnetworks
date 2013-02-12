class Photo < ActiveRecord::Base
  attr_accessible :friend_id, :name, :url, :update_date, :create_date
  
  belongs_to :friend
  validates_uniqueness_of :url
  
end
