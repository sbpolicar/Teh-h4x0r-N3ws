class SessionsController < ApplicationController

  before_action :check_no_auth, except: [:destroy]

  def new
    render layout: false
  end

  def create


    user = User.authenticate(params[:user][:email], params[:user][:password])
    if(user)
      session[:user_id] = user.id
      flash[:success] = "You are logged in."
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You are logged out."
    redirect_to root_path
  end

end
