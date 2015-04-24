request = require 'request'
endpoints = require '../endpoints'

module.exports = (socket, name) ->
  request.get
    url: endpoints.getUrl("net", "lxcresources", name)
    (err, response, body) ->
      socket.emit "net_usage", {value: body, name: name}

