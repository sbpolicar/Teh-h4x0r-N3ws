class UsersController < ApplicationController

  before_action :check_no_auth

  def new
    @user = User.new
  end

  def create
    new_user = User.create user_params
    if new_user.persisted?
      flash[:success] = "You are signed up. Login below."
      redirect_to login_path
    else
      flash[:danger] = new_user.errors.full_messages.uniq.to_sentence
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:password)
  end

end
