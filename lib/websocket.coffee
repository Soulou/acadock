mem_stream = require './websocket/mem'
cpu_stream = require './websocket/cpu'

data_stream = (socket, name) ->
  setTimeout ->
    mem_stream socket, name
    cpu_stream socket, name
    data_stream socket, name
  , 1000


module.exports = (io, name) ->
  io.sockets.on 'connection', (socket) ->
    data_stream socket, name
    
