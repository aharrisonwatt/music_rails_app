class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(session_params_email, session_params_password)
    if @user
      @user.session_token = generate_session_token
      session[:session_token] = @user.session_token
      @user.save
      redirect_to user_url
    else
    end
  end

  def destroy
  end

  private

  def session_params_email
    params.require(:session).permit(:email)
  end

  def session_params_password
    params.require(:session).permit(:password)
  end
end
