class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update] 
  before_filter :correct_user, :only => [:edit, :update]  
  before_filter :correct_id, :only => [:show]
  
  def new 
    @user = User.new 
    @title = 'Sign up' 
  end 
    
  def show 
    #@user = User.find(params[:id])
    @title = @user.name 
  end 
    
  def create 
    @user = User.new(params[:user]) 
    if @user.save 
      sign_in(@user)  
      flash[:success] = "Welcome to the Tractor's Heaven"  
      redirect_to @user 
    else 
      @title = "Sign up" 
      render 'new' 
    end 
  end 
  
  def edit  
    @title = "Edit user" 
  end 
  
  def update 
    @user = User.find(params[:id]) 
    if @user.update_attributes(params[:user]) 
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit"
      render 'edit'
    end
  end
   
  def current_user?(user) 
    user == current_user 
  end
  
  def deny_access 
    flash[:notice] =  "Please sign in to acces this page"
    redirect_to(signin_path)
  end
  
  private
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id]) 
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def correct_id
    if is_number(params[:id])
      correct_user
    else
      redirect_to("/#{params[:id]}")
    end
  end
  
  def is_number(id)
    id =~ /[\d]/
  end
end
