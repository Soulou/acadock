_ = require "underscore"
docker = require "../docker"
request = require "request"


class Container
  constructor: (id) ->
    @id : id

  @findAll: (cb) ->
    request.post docker.endpoints.list, (err, response, body) ->
      if response.statusCode != 200
        cb(null, err)
      else
        containers = _.map body, (container) ->
          new Container container.id
        cb(containers, null)



    
