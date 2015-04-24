$ ->
  @id = $("#container-id").text()
  socket = io.connect(window.location.protocol + "//" + window.location.hostname + ":" + window.location.port)
  socket.on 'mem_usage', (data) =>
    if data.name == @id
      updateMemChartData(data.value)
  socket.on 'cpu_usage', (data) =>
    if data.name == @id
      updateCpuChartData(data.value)
  socket.on 'net_usage', (data) =>
    if data.name == @id
      updateNetChartData(JSON.parse(data.value))
  socket.on 'output', (data) =>
    if data.name == @id
      updateOutputView(data.value)
