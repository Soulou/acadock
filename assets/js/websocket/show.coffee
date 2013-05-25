$ ->
  socket = io.connect(window.location.protocol + "//" + window.location.hostname + ":" + window.location.port)
  socket.on 'mem_usage', (data) ->
    console.log "mem : " + data.value
  socket.on 'cpu_usage', (data) ->
    console.log "CPU : " + data.value + "%"
