class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logout
    session[:user_id] = nil
  end

  def prevent_double_voting
    if already_voted?
      flash[:error] = "You have already voted in this poll"
      redirect_to poll_path(poll)
    end
  end

  def already_voted?
    (session[:votes_cast] && session[:votes_cast].include?(poll.id)) || current_user.voted?(poll)
  end
  helper_method :already_voted?

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
