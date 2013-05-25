request = require 'request'
endpoints = require '../endpoints'

module.exports = (socket, name) ->
  request.get
    url: endpoints.getUrl("cpu", "lxcresources", name)
    (err, response, body) ->
      socket.emit "cpu_usage", {value: body, name: name}

