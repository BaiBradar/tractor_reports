require 'spec_helper'

describe TractorDriver do
  before(:each) do
    @user = Factory(:user)
    @attr = {:name => "Some Driver"}
  end
  
  it 'should create a instance of tractor-user to given user' do
    @user.tractor_drivers.create!(@attr)
  end
  
  describe "User associations" do
    before(:each) do
      @tractor_driver = @user.tractor_drivers.create!(@attr)
    end
    
    it "should have a user atribute" do
      @tractor_driver.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @tractor_driver.user_id.should == @user.id
      @tractor_driver.user.should == @user
    end
  end  
  
  describe "Validations" do
    it "tractor driver should require a user_id" do
      TractorDriver.new(@attr).should_not be_valid
    end
    
    it 'should require a non-blank tractor driver name' do  
      @user.tractor_drivers.build(@attr.merge(:name => "   ")).should_not be_valid 
    end
    it 'should reject long tractor driver names' do
      @user.tractor_drivers.build(@attr.merge(:name => "a"*60)).should_not be_valid 
    end
    
    it "should reject short tractor_driver names" do
      @user.tractor_drivers.build(@attr.merge(:name => "123")).should_not be_valid 
    end  end    
end
