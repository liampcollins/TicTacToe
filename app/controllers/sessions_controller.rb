class SessionsController < ApplicationController
  def new
  end

  #LOG IN 
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    #change root_path to menu when created
    redirect_to root_path, notice: 'logged in!' 
    else
    flash.now.alert = "invalid login credentials"
    render "new"
    end
  end  


  #LOG OUT
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "logged out!"
  end
end
