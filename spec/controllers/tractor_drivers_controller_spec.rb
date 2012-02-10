require 'spec_helper'

describe TractorDriversController do
  before(:each) do
    @user = Factory(:user)
    test_sign_in(@user)
  end
  
  describe "Get 'add_tractor_driver" do
    it "should be successfull" do
      get :add_tractor_driver
      response.should be_success
    end
  end
  
  describe "post 'create'" do
    before(:each) do
      @attr = { :name => "Emil Borisov" }
    end
    
    it "Should create a new driver" do
      lambda do
        post :create, :tractor_driver => @attr
      end.should change(@user.tractor_drivers, :count)
    end
    
    it "should redirect to add tractor drivers" do
      post :create, :tractor_driver => @attr
      response.should redirect_to(add_tractor_driver_path)
    end
  end
end
