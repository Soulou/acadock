$ ->
  socket = io.connect(window.location.protocol + "//" + window.location.hostname + ":" + window.location.port)
  socket.on 'mem_usage', (data) =>
    console.log "mem : " + data.value
    updateMemChartData(data.value)
  socket.on 'cpu_usage', (data) =>
    console.log "cpu : " + data.value + "%"
    updateCpuChartData(data.value)

