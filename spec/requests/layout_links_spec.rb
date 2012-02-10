require 'spec_helper'

describe "LayoutLinks" do
  it "should have Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it 'should have Sign up page at "/signup"' do
    get "/signup"
    response.should have_selector('title', :content => 'Sign up')
  end
  
  it "should reject names that are too long" do
    long_name = "krasi"* 50
    long_name_user = User.new({:name => long_name, :email => "dasd"})
    long_name_user.valid?.should_not == true
  end
  
  describe "when not sign in" do
    it "should have a sign in link" do
      visit root_path
      response.should have_selector("a", :href => signin_path, :content => "Sign in")
    end
  end
  
  describe "when signed in" do
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    it "should have a sign out link" do 
      visit root_path
      response.should have_selector('a', :href => signout_path, :content => "Sign out")
    end
  end
end
