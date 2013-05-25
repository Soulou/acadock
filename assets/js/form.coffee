$ ->
  $('#create-container-btn').on 'click', (event) ->
    $.ajax
      type: 'POST'
      url: '/containers/create'
      dataType: 'json'
      success: (data) ->
        console.log "Success : "
        console.log(data)
      error: (xhr, type) ->
        console.log "Error : "
        console.log xhr
