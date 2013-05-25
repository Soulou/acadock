$ ->
  form = $('#create-form')
  form.on 'submit', (event) ->
    debugger
    $.ajax ->
      type: 'POST'
      url: this.action
      dataType: 'json'
      success(data) ->
          console.log(data)
      error: (xhr, type) ->
        alert("Ajax error")
    event.preventDefault()
  
