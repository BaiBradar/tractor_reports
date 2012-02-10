require 'spec_helper'

describe Land do
  before(:each) do
    @user = Factory(:user)
    @attr = {:name => "Some land", :region => "Pleven"}
  end
  
  it 'should create a instance of land to given user' do
    @user.lands.create!(@attr)
  end
  
  describe "User associations" do
    before(:each) do
      @land = @user.lands.create!(@attr)
    end
    
    it "should have a user atribute" do
      @land.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @land.user_id.should == @user.id
      @land.user.should == @user
    end
  end  
  
  describe "Validations" do
    it "land should require a user_id" do
      Land.new(@attr).should_not be_valid
    end
    
    it 'should require a non-blank land name' do  
      @user.lands.build(@attr.merge(:name => "   ")).should_not be_valid 
    end
    it 'should reject long land name' do
      @user.lands.build(@attr.merge(:name => "a"*60)).should_not be_valid 
    end
    
    it "should reject short land names" do
      @user.lands.build(@attr.merge(:name => "et")).should_not be_valid 
    end
    
    it 'should require a non-blank land region' do  
      @user.lands.build(@attr.merge(:region => "   ")).should_not be_valid 
    end
    
    it 'should reject long land region' do
      @user.lands.build(@attr.merge(:region => "a"*60)).should_not be_valid 
    end
    
    it "should reject short land region" do
      @user.lands.build(@attr.merge(:region => "et")).should_not be_valid 
    end  end    
end
