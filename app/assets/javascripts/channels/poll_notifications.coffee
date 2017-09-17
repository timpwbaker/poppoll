App.poll_notifications = App.cable.subscriptions.create "PollNotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#option_' + data["option_id"]).text data["votes_cast"]
    # Called when there's incoming data on the websocket for this channel
