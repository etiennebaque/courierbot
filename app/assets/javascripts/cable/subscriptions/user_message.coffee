App.cable.subscriptions.create { channel: "UserMessageChannel" },
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    $(html).prependTo "##{data.type}Table > tbody"
    $("##{data.id}").effect("highlight", {color: "#{data.highlight}"}, 2000)

  createLine: (data) ->
    "<tr id='#{data.id}'><td>#{data.description} <span class='reporter'>(#{data.user_time})</span></td></tr>"


# App.cable.subscriptions.create { channel: "UserMessageChannel", room: "Request" }
