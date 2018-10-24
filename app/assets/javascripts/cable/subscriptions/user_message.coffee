App.cable.subscriptions.create { channel: "UserMessageChannel" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    $(html).prependTo "##{data.type}-table > tbody"
    $("##{data.id}").effect("highlight", {color: "#{data.highlight}"}, 2000)

  createLine: (data) ->
    "<tr id='#{data.id}'><td>#{data.description} <span class='user-city-note'>(#{data.username})</span></td></tr>"


# App.cable.subscriptions.create { channel: "UserMessageChannel", room: "Request" }
