_ = require "underscore"
Docker = require "../docker"
request = require "request"


class Container
  constructor: (params) ->
    console.log(params)
    @id = params.Id
    @image = params.Image
    @status = params.Status
    @created = new Date parseInt(params.Created)
    @user = params.User
    @hostname = params.Hostname
    @command = params.Command

  @findAll: (cb) ->
    request.get
      url: Docker.getUrl "list"
      (err, response, body) ->
        if response.statusCode != 200
          cb(null, err)
        else
          docker_containers = JSON.parse(body)
          containers = _.map docker_containers, (container) ->
            new Container container
          cb(containers, null)

  @create: (params, cb) ->
    request.post
      url: Docker.getUrl "create"
      form:
        Hostname: params.Hostname|| ""
        User: params.User|| ""
        Memory: 0
        MemorySwap: 0
        AttachStdin: false
        AttachStdout: true
        AttachStderr: true
        PortSpecs: null
        Tty: false
        OpenStdin: false
        StdinOnce: false
        Env: null
        Cmd: [params.Command]
        Dns: null
        Image: "base"
        Volumes: {}
        VolumesFrom: ""

      (err, response, body) ->
        if err || response.statusCode != 200
          console.log(err)
          console.log(response)
          console.log(body)
          cb(null, err)
        else
          console.log(err)
          console.log(response)
          console.log(body)
          docker_container = JSON.parse(body)
          container = new Container
          cb(container, null)

module.exports = Container
