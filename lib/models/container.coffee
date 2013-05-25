_ = require "underscore"
Docker = require "../docker"
request = require "request"


class Container
  constructor: (id, image, status)->
    @id = id
    @image = image
    @status = status

  @findAll: (cb) ->
    request.get Docker.getUrl("list"),
      (err, response, body) ->
        if response.statusCode != 200
          cb(null, err)
        else
          docker_containers = JSON.parse(body)
          containers = _.map docker_containers, (container) ->
            new Container container.Id, container.Image, container.Status
          cb(containers, null)

module.exports = Container
