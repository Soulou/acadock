_ = require "underscore"
Docker = require "../docker"
request = require "request"


class Container
  constructor: (params) ->
    @id = params[id]
    @image = params[image]
    @status = params[status]
    @created = new Date parseInt(params[created])
    @user = params[user]
    @hostname = params[hostname]
    @command = params[command]

  @findAll: (cb) ->
    request.get
      url: Docker.getUrl "list"
      (err, response, body) ->
        if response.statusCode != 200
          cb(null, err)
        else
          docker_containers = JSON.parse(body)
          containers = _.map docker_containers, (container) ->
            new Container container.Id, container.Image, container.Status, container.Created
          cb(containers, null)

  @create: (params, cb) ->
    request.post
      url: Docker.getUrl "create"
      form:
        Hostname: params[hostname] || ""
        User: params[user] || ""
      (err, response, body) ->
        if err || response.statusCode != 200
          console.log(err)
          cb(null, err)
        else
          console.log(err)
          console.log(response)
          console.log(body)
          docker_container = JSON.parse(body)
          container = new Container
          cb(container, null)

module.exports = Container
