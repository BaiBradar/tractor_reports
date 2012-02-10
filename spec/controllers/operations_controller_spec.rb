require 'spec_helper'


describe OperationsController do
  before(:each) do
    @user = Factory(:user)
    test_sign_in(@user)
  end
  
  describe "Get 'add_operation'" do
    it "should be successfull" do
      get :add_operation
      response.should be_success
    end
  end
  
  describe "post 'create'" do
    before(:each) do
      @attr = { :name => "Oran", :fuel_dk => 2.0, :price_dk => 0.4 }
    end
    
    it "Should create a new operation" do
      lambda do
        post :create, :operation => @attr
      end.should change(@user.operations, :count)
    end
    
    it "should redirect to add operation" do
      post :create, :operation => @attr
      response.should redirect_to(add_operation_path)
    end
  end
end
