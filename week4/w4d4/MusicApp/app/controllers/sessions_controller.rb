class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:email], session_params[:password])
    if user
      log_in(user)
      flash[:messages] = ["Welcome back"]
      redirect_to user_url(users)
    else
      flash[:messages] = ["Invalid credentials"]
      redirect_to new_user_url
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
