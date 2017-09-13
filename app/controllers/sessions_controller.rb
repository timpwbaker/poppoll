class SessionsController < ApplicationController
  before_action :logout, only: [:new]
  def new

  end

  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "Successfully signed in"
    else
      redirect_to new_session_path, notice: "Incorrect email or password"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
