class PollNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "poll_notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
