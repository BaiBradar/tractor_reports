require 'spec_helper'

describe Tractor do
  before(:each) do
    @user = Factory(:user)
    @attr = {:code => "5107", :current_fuel => 0, :registration => "BT5107"}
  end
  
  it 'should create a instance of tractor to given user' do
    @user.tractors.create!(@attr)
  end
  
  it "should add 0 fuel if user dont add" do
    @user.tractors.build({:code => "5107", :registration => "BT5107" })
    @user.tractors.first.current_fuel.should == 0.0
  end
  
  describe "User associations" do
    before(:each) do
      @tractor = @user.tractors.create!(@attr)
    end
    
    it "should have a user atribute" do
      @tractor.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @tractor.user_id.should == @user.id
      @tractor.user.should == @user
    end
  end  
  
  describe "Validations" do
    it "should require a user_id" do
      Tractor.new(@attr).should_not be_valid
    end
    
    it 'should require a non-blank reg' do  
      @user.tractors.build(@attr.merge(:registration => " ")).should_not be_valid 
    end
    
    it 'should require a non-blank code' do  
      @user.tractors.build(@attr.merge(:code => " ")).should_not be_valid 
    end
    
    it 'should reject long tractor code' do
      @user.tractors.build(@attr.merge(:code => "123456789")).should_not be_valid 
    end
    
    it "should reject short tractor code" do
      @user.tractors.build(@attr.merge(:code => "123")).should_not be_valid 
    end
    
    it "should reject short tractor reg" do
      @user.tractors.build(@attr.merge(:registration => "123")).should_not be_valid 
    end
    
    it "should reject long tractor reg" do
      @user.tractors.build(@attr.merge(:registration => "12345678901112131415")).should_not be_valid 
    end
  end   
end 