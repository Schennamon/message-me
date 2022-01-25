class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "You have successfully signed up, log in to chat"
      redirect_to login_path
    else
      flash.now[:error] = "You were unable to register"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end