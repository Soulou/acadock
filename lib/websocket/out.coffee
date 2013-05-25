request = require 'request'
endpoints = require '../endpoints'

module.exports = (socket, name) ->
  request.post
    url: (endpoints.getUrl "attach", "docker", name)
    (err, response, body) ->
      socket.emit "output", {value: body, name: name}
