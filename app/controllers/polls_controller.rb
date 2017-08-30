class PollsController < ApplicationController
  def new
    poll = Poll.new
    render locals: { poll: poll }
  end

  def create
    poll = Poll.new(poll_params)
    if poll.save
      redirect_to root_path, notice: "Poll created"
    else
      render :new, locals: { poll: poll }
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:question, :user_id)
  end
end
