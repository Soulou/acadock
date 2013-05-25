$ ->
  socket = io.connect(window.location.protocol + "//" + window.location.hostname + ":" + window.location.port)
  socket.on 'mem_usage', (data) =>
    updateMemChartData(data.value)
  socket.on 'cpu_usage', (data) =>
    updateCpuChartData(data.value)
  socket.on 'output', (data) ->
    updateOutputView(data.value)
