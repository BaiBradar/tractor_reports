require 'spec_helper'

describe LandsController do
  before(:each) do
    @user = Factory(:user)
    test_sign_in(@user)
  end
  
  describe "Get 'add_land'" do
    it "should be successfull" do
      get :add_land
      response.should be_success
    end
  end
  
  describe "post 'create'" do
    before(:each) do
      @attr = { :name => "Obvnova", :region => "Pleven" }
    end
    
    it "Should create a new land" do
      lambda do
        post :create, :land => @attr
      end.should change(@user.lands, :count)
    end
    
    it "should redirect to add land" do
      post :create, :land => @attr
      response.should redirect_to(add_land_path)
    end
  end
end
