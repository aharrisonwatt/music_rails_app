class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
