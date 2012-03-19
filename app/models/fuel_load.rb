class FuelLoad < ActiveRecord::Base
  attr_accessible :amount, :loaded_at, :tractor_driver_name, :tractor_code
  
  validates :amount, :inclusion => { :in => 0.0..900.0 }
  validates :user_id, :presence => true
  validates :tractor_code, :presence => true
  validates :tractor_driver_name, :presence => true
  
  
  belongs_to :user
  belongs_to :tractor
  belongs_to :tractor_driver
  
end
