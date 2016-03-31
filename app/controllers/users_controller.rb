class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
