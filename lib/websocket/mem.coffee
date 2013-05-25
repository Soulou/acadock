request = require 'request'
endpoints = require '../endpoints'
Container = require '../models/container'

module.exports = (socket, name) ->
  request.get
    url: endpoints.getUrl("mem", "lxcresources", name)
    (err, response, body) ->
      socket.emit "mem_usage", {value: body}

