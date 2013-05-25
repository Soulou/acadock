$ ->
  $(".container-destroy").on "click", (event) ->
    $.ajax
      url: this.href
      type: "DELETE"
      success: (data, status, xhr) =>
          $(this).parent().parent().hide(200)
      error: (xhr, errorType, error) =>
          $(this).parent().parent().css "backgournd-color", "#ff0000"
    false
          
