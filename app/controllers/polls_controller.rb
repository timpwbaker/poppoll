class PollsController < ApplicationController
  def new
    poll = Poll.new
    2.times { poll.options.build }
    render locals: { poll: poll }
  end

  def create
    poll = Poll.new(poll_params)
    if poll.save
      redirect_to poll_path(poll), notice: "Poll created"
    else
      render :new, locals: { poll: poll }
    end
  end

  def show
    render locals: { poll: poll }
  end

  private

  def poll
    Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, :user_id, options_attributes: [:body, :id, :_destroy])
  end
end
