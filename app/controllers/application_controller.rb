class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logout
    session[:user_id] = nil
  end

  def current_user
    if active_session?
      User.find(session[:user_id])
    else
      User.guest
    end
  end
  helper_method :current_user

  def active_session?
    if session[:user_id]
      true
    else
      false
    end
  end
  helper_method :active_session?
end
