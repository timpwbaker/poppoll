class SessionsController < ApplicationController
  before_action :logout, only: [:new]
  def new

  end

  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully signed in"
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password"
      redirect_to new_session_path
    end

  end

  def destroy
    session[:user_id] = nil
    session[:votes_cast] = nil
    flash[:success] = "Signed out"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
