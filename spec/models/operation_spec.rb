require 'spec_helper'
#build set the user_id to User.id
describe Operation do
  before(:each) do
    @user = Factory(:user)
    @attr = {:name => "Operation", :fuel_dk => 2.8, :price_dk => 0.5, }
  end
  
  it 'should create a instance of operation to given user' do
    @user.operations.create!(@attr)
  end
  
  describe "User associations" do
    before(:each) do
      @operation = @user.operations.create!(@attr)
    end
    
    it "should have a user atribute" do
      @operation.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @operation.user_id.should == @user.id
      @operation.user.should == @user
    end
  end  
  
  describe "Validations" do
    it "operation should require a user_id" do
      Operation.new(@attr).should_not be_valid
    end
    
    it 'should require a non-blank operation name' do  
      @user.operations.build(@attr.merge(:name => "   ")).should_not be_valid 
    end
    it 'should reject long operation name' do
      @user.operations.build(@attr.merge(:name => "a"*60)).should_not be_valid 
    end
    
    it "should reject short operation name" do
      @user.operations.build(@attr.merge(:name => "et")).should_not be_valid 
    end
    
    it "should reject impossible big price per decker" do
      @user.operations.build(@attr.merge(:price_dk => 35.0)).should_not be_valid
    end
    
    it "should reject negative price per decker" do
      @user.operations.build(@attr.merge(:price_dk => -911.0)).should_not be_valid
    end
    
    it "should reject negative fuel per decker" do
      @user.operations.build(@attr.merge(:fuel_dk => -0.1)).should_not be_valid
    end
    
    it "should reject big fueld cost per decker" do
      @user.operations.build(@attr.merge(:fuel_dk => 112)).should_not be_valid
    end  end    
end
