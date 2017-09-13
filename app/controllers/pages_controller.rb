class PagesController < ApplicationController
  def index
    poll = Poll.new
    2.times { poll.options.build }
    render locals: { poll: poll }
  end
end
