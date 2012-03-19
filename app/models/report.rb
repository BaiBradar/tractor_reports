class Report < ActiveRecord::Base
  attr_accessible :decker, :date, :tractor_code, :tractor_driver_name, :land_name, :operation_name, :salary, :approximate_fuel_cost
  
  before_save :calculate_attributes
  
  belongs_to :users
  belongs_to :tractors
  belongs_to :tractor_drivers
  belongs_to :lands
  belongs_to :operations
  
  validates :decker, :presence => true, :inclusion => { :in => 1..5000 }
  validates :date, :presence => true
  validates :user_id, :presence => true
  validates :tractor_code, :presence => true
  validates :tractor_driver_name, :presence => true
  validates :land_name, :presence => true
  validates :operation_name, :presence => true
  
  def salary
    decker * price_dk
  end
  
  def approximate_fuel_cost
    decker * fuel_dk
  end
  
  def price_dk
    user = User.find(self.user_id)
    op = user.operations.where("name = ?", self.operation_name).first
    op.price_dk
  end
  
  def fuel_dk
    user = User.find(self.user_id)
    op = user.operations.where("name = ?", self.operation_name).first
    op.fuel_dk
  end
end
 