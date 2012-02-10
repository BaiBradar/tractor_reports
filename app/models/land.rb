class Land < ActiveRecord::Base
  attr_accessible :name, :region
  
  validates :name, :presence => true, :uniqueness => true, :length => { :within => 3..40 }
  validates :region, :presence => true, :length => { :within => 3..40 }
  validates :user_id, :presence => true


  has_many :reports, :dependent => :destroy
  belongs_to :user
end
