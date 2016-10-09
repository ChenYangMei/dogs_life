class SessionsController < ApplicationController

  def new

  end

  def facebook_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect_to root_url
  end

  def create
    user = User.find_by :email => params[:email]

    if user && user.authenticate(params[:password])
      flash[:success] = "User successfully logged in"
      session[:user_id] = user.id
      redirect_to root_url

    else
      flash[:error] = "Your password or email is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
