$ ->
  @canScroll = true
  _this = this

  $("#container-attachment").on "scroll", (event) ->
    _this.canScroll = false
    if this.scrollTop == this.scrollHeight - this.offsetHeight
      debugger
      _this.canScroll = true
      
  @updateOutputView = (text) ->
    $("#container-attachment code").text(text)
    if _this.canScroll
      $("pre#container-attachment")[0].scrollTop = 99999999
