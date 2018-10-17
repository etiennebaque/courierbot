App.cable.subscriptions.create { channel: "UserMessageChannel" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    #html = @createLine(data)
    $("<tr><td>#{data.description}</td></tr>").prependTo '#need-table > tbody'

  createLine: (data) ->
    data["description"]


# App.cable.subscriptions.create { channel: "UserMessageChannel", room: "Request" }
