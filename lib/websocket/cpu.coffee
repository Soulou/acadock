request = require 'request'
endpoints = require '../endpoints'
Container = require '../models/container'

module.exports = (socket, name) ->
  request.get
    url: endpoints.getUrl("cpu", "lxcresources", name)
    (err, response, body) ->
      socket.emit "cpu_usage", {value: body}

