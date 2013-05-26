$ ->
  sendCommand = (command) ->
    $.ajax
      url: '/containers/create'
      type: 'POST'
      data:
        "container[command]" : command
      success: (data, status, xhr) =>
        status = '<span class="statuslight"><div class="'
        if data.State.Running
          status += 'lightup'
        else
          status += 'lightdown'
        status += '"></div></span>'

        $('ul#containers').prepend(
          '<li class="container-info">' + status + '<a href="/containers/' + data.Id + '">' + "ID " + data.Id.substring(0,12) + '</a>' +
          '<span class="pull-right"><a class="container-destroy" href="/containers/' + data.Id + '">' + '<button>Destroy</button></a></span></li>'
        )
            
      error: (xhr, errorType, error) =>
        $(this).css "backgournd-color", "#ff0000"


  $(".cli").focus()
  $(".cli").on "keypress", (event) ->
    if(event.keyCode == 13)
      sendCommand(this.value)
