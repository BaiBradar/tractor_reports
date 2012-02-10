require 'spec_helper'

describe TractorsController do
  before(:each) do
    @user = Factory(:user)
    test_sign_in(@user)
  end

  describe "Get 'add_machine'" do
    it "should be successfull" do
      get :add_machine
      response.should be_success
    end
  end
  describe "post 'create'" do
    before(:each) do
      @attr = { :code => "5107", :registration => "BT5107", :current_fuel => 100 }
    end
    
    it "Should create a new tractor" do
      lambda do
        post :create, :tractor => @attr
      end.should change(@user.tractors, :count)
    end
    
    it "should redirect to add tractor" do
      post :create, :tractor => @attr
      response.should redirect_to(add_machine_path)
    end
  end
end
