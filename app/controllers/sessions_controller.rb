class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:email],
      session_params[:password])

    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:no_user] = "Incorrect email/password combination"
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to user_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
