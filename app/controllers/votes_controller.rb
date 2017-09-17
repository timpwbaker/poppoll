class VotesController < ApplicationController
  before_action :prevent_double_voting, only: [:create]

  def create
    if Option.add_vote(option.id)
      register_vote
      flash[:success] = "Successfully voted"
      redirect_to poll_path(poll)
    else
      flash[:error] = "Vote failed"
      redirect_to poll_path(poll)
    end
  end

  def destroy

  end

  private

  def register_vote
    add_vote_to_user_account
    add_vote_to_session
    notify_client_side
  end

  def notify_client_side
    ActionCable.server.broadcast "poll_notifications_channel", option_id: option.id.to_s, votes_cast: option.vote_count.to_s
  end

  def add_vote_to_user_account
    if active_session?
      current_user.store_vote(option)
    end
  end

  def add_vote_to_session
    session[:votes_cast] ||= []
    session[:votes_cast] << poll.id
  end

  def option
    Option.find(params[:option_id])
  end

  def poll
    option.poll
  end
end
