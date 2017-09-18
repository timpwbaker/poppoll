class PagesController < ApplicationController
  def index
    poll = Poll.new
    2.times { poll.options.build }
    render locals: { poll: poll, new_polls: new_polls }
  end

  private

  def new_polls
    Poll.last(3)
  end
end
