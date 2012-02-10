require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Tisho Zmeq", :email => "razenemail@abv.bg", :company => "mlad ogneoborec", :password => "monkey", :password_confirmation => "monkey"}
  end

  
  it "should create a new instace given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name = User.new(@attr.merge(:name => ""))
    no_name.valid?.should_not == true
  end
  
  it "should have email != ''" do
    no_email = User.new(@attr.merge(:email => ''))
    no_email.valid?.should_not == true
  end
  
  it "shoud accept emails" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org]
    adresses.each do |addr|
      valid_e = User.new(@attr.merge(:email => addr))
      valid_e.should be_valid
    end
  end
  
  it "should reject qrong emails" do
    adresses = %w[user@foo,com THE_USER_at_foo.bar.org]
    adresses.each do |addr|
      invalid_e = User.new(@attr.merge(:email => addr))
      invalid_e.should_not be_valid
    end
  end
  
  describe "Password validation" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end
    
    it "should reject short passwords" do
      short_p = "tish"
      hash = @attr.merge(:password => short_p, :password_confirmation => short_p)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long password" do
      long_p = "tish"*55
      hash = @attr.merge(:password => long_p, :password_confirmation => long_p)
      User.new(hash).should_not be_valid
    end
    
    it "should not accpet different pass-confirmation" do
      User.new(@attr.merge(:password_confirmation => "djastur")).should_not be_valid
    end
    
  end
  
  describe "Password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "encrypted password should not be empty" do 
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      it "should be true if password match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if password dont match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "User authentication" do
      it "should return nill if email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end
      
      it "should return nil for email adress with no user" do
        wrong_email_user = User.authenticate("tahsak@mail.com", @attr[:password])
        wrong_email_user.should be_nil
      end
      
      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
  end
end
