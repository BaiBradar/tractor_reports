class Tractor < ActiveRecord::Base
  require 'bigdecimal'
  require 'bigdecimal/util'
  
  attr_accessible :current_fuel, :registration, :code, :user_id
  
  belongs_to :user
  has_many :fuel_loads, :dependent => :destroy
  has_many :reports, :dependent => :destroy
  
  validates :registration, :presence => true, :length => { :within => 6..15 }, :uniqueness => true
  validates :user_id, :presence => true
  validates :code, :presence => true, :length => { :within => 4..8}, :uniqueness => true
  
  before_save :check_fuel
  
  def add_fuel(amount)
    self.current_fuel = self.current_fuel + amount
  end
  
  private
  
  def check_fuel
    if self.current_fuel
      self.current_fuel = self.current_fuel.to_d
    else
      self.current_fuel = '0'.to_d
    end
  end
end
