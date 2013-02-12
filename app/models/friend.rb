class Friend < ActiveRecord::Base
  attr_accessible :facebook_id, :name, :picture
  
  has_many :group
  has_many :users, :through => :groups
  
  validates_presence_of :facebook_id
  validates_presence_of :name
  validates_uniqueness_of :facebook_id

  has_many :photos
    
    
end
