$ ->
  sendCommand = (command) ->
    if !isNaN $(".port").val()
      port = $(".port").val()
    $.ajax
      url: '/containers/create'
      type: 'POST'
      data:
        "container[command]" : command
        "container[port]" : port
      success: (data, status, xhr) =>
        status = '<span class="statuslight"><div class="'
        status += 'lightup'
        status += '"></div></span>'

        item = $(
          '<li class="container-info">' + status + '<a href="/containers/' + data.Id + '">' + "ID " + data.Id.substring(0,12) + '</a>' +
          '<span class="pull-right"><span class="command">' + data.Config.Cmd.join(' ') + '</span><a class="container-destroy" href="/containers/' + data.Id + '">' + '<button>Destroy</button></a></span></li>'
        )
        item.css('height', 0)
        $('ul#containers').prepend(item)
        item.animate
          height: "19px"
          500, 'ease-out'
            
      error: (xhr, errorType, error) =>
        $(this).css "backgournd-color", "#ff0000"


  $(".cli").focus()
  $(".cli, .port").on "keypress", (event) ->
    if($(".cli").val() != "" && event.keyCode == 13)
      sendCommand($(".cli").val())
