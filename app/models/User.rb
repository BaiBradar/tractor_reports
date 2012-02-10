class User < ActiveRecord::Base
  require 'digest'
  has_many :tractors, :dependent => :destroy
  has_many :tractor_drivers, :dependent => :destroy
  has_many :lands, :dependent => :destroy
  has_many :operations, :dependent => :destroy
  has_many :fuel_loads, :dependent => :destroy
  has_many :reports, :dependent => :destroy
  
  attr_accessor :password
  attr_accessible :name, :email, :company, :password, :password_confirmation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #
  
  validates :company, :presence => true, :length => { :within => 3..20 }
  validates :name, :presence => true, :length => {:maximum => 50}
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, :confirmation => true, :presence => true, :length => { :within => 6..40 }
                      
  before_save :encrypt_password
  
  def has_password?(submited_password)
    encrypted_password == encrypt(submited_password)
  end
  
  def User.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)  end
  
  def User.authenticate_with_id(id)
    user = User.find_by_id(id)
    user
  end
  
  private
  
  def encrypt_password
    self.encrypted_password = encrypt(password)
  end 
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
  
  def encrypt(string)
    secure_hash(string)
  end
end
