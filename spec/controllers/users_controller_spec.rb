require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'Edit'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    it "should be successful" do
      get :edit, :id => @user
      response.should be_success
    end
    
    it "should have the right title" do 
      get :edit, :id => @user
      response.should have_selector("title", :content => "Edit user")
    end
  end
  
  describe "PUT 'update'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    describe "failure" do
      before(:each) do 
        @attr = { :name => "", :email => "", :password => "", :password_confirmation => "" }
      end
    
      it 'should render the "edit" page' do
        put :update, :id => @user, :user => @attr
        response.should render_template('edit')
      end
      
      it "should have the right title" do
        put :update, :id => @user, :user => @attr
        response.should have_selector("title", :content => "Edit")
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = {  :name => "New Name", :email => "user@example.org",
                  :password => "barbaz", :password_confirmation => "barbaz" }
      end
      
      it "should redirect to the user show page" do 
        put :update, :id => @user, :user => @attr
        response.should redirect_to(user_path(@user))
      end
      
      it "should change the user atriburtes" do
        put :update, :id => @user, :user => @attr
        @user.reload
        @user.name.should == @attr[:name]
        @user.email.should == @attr[:email]
      end
      
      it "should have a flash message" do
        put :update, :id => @user, :user => @attr
        flash[:success].should =~ /updated/
      end
    end
  end
  
  describe "get 'show' " do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    it "should have the right head" do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.name) 
    end
    
    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector('h1', :content => @user.name)
    end
      
    it "should be succsesful" do  
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => 'Sign up')
    end
  end 
  
  describe "POST 'create'" do

    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => "" }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end
          
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
  end
  
#  describe "authenticate for 'show' page" do
 #   before(:each) do
      #@user = Factory(:user)
     # test_sign_in(@user)
    #end
    
    #it 'should not let users enter in other users pages' do
      #wrong_id = '5'
     # get :show, :id => wrong_id
    #  response.should redirect_to(root_path)
   # end
  #end
  
  describe "authenticate for edit/update pages" do 
    before(:each) do
      @user = Factory(:user)
    end
    
    describe 'for sign in users' do
      before(:each) do
        wrong_user = Factory(:user, :email => "someemaip@abv.bg")
        test_sign_in(wrong_user)
      end
      
      it 'should require matching users for edit' do
        get :edit, :id => @user
        response.should redirect_to(root_path)
      end
      
      it "should require matching users for 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(root_path)
      end
    end
    
    describe 'for non-signed users' do
      it "should deny access to 'edit'" do
        get :edit, :id => @user
        response.should redirect_to(signin_path)
      end
      
      it "should deny acc to 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(signin_path)
      end
    end
  end
end 
