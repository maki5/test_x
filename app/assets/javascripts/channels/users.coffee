App.users = App.cable.subscriptions.create "UsersChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    user_id = data["id"]

    $("#user_" + user_id).replaceWith data['user']
    $("#user_edit_" + user_id).replaceWith data['user_edit']

    $('.edit_user').click (event)->

      event.preventDefault()
      edit_id = $(this).attr("data-id")
      $("#" + edit_id).show()
      return

update: ->
    @perform 'update'


