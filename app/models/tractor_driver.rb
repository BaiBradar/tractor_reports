class TractorDriver < ActiveRecord::Base
  attr_accessible :name
  
  validates :user_id, :presence => true
  validates :name, :presence => true, :length => { :within => 4..50}, :uniqueness => true
  
  belongs_to :user
  has_many :fuel_loads, :dependent => :destroy
  has_many :reports, :dependent => :destroy
end
