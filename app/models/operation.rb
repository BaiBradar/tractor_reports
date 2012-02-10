class Operation < ActiveRecord::Base
  attr_accessible :name, :fuel_dk, :price_dk
  
  validates :name, :presence => true, :length => { :within => 3..40 }, :uniqueness => true
  validates :fuel_dk, :presence => true, :inclusion => { :in => 0.0..15.0 }
  validates :price_dk, :presence => true, :inclusion => { :in => 0.0..15.0 }
  validates :user_id, :presence => true
  
  has_many :reports, :dependent => :destroy
  belongs_to :user
end
