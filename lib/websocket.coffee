mem_stream = require './websocket/mem'
cpu_stream = require './websocket/cpu'
net_stream = require './websocket/net'
out_stream = require './websocket/out'

data_stream = (socket, name) ->
  setTimeout ->
    out_stream socket, name
    mem_stream socket, name
    cpu_stream socket, name
    net_stream socket, name
    data_stream socket, name
  , 1000


module.exports = (io, name) ->
  io.sockets.on 'connection', (socket) ->
    timer = data_stream socket, name
    socket.on "disconnect", ->
      clearTimeout(timer)
