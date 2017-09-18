class SearchesController < ApplicationController
  def index
    render locals: { matching_polls: matching_polls }
  end

  def matching_polls
    Poll.where("question like ?", "%#{params[:query]}%")
  end
end
