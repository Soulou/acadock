_ = require "underscore"
endpoint = require "../endpoints"
request = require "request"
util = require 'util'
fs = require 'fs'


class Container
  @find: (name, cb) ->
    request.get
      url: endpoint.getUrl "inspect", "docker", name
      (err, response, body) ->
        if response.statusCode != 200
          cb null, body
        else
          docker_container = JSON.parse(body)
          cb docker_container, null

  @findAll: (cb) ->
    request.get
      url: endpoint.getUrl "list", "docker"
      (err, response, body) ->
        if response.statusCode != 200
          cb null, body
        else
          docker_containers = JSON.parse(body)
          cb(docker_containers, null)

  @create: (params, cb) ->
    request.post
      url: endpoint.getUrl "create", "docker"
      json:
        "Hostname": params.hostname || ""
        "User": params.user || ""
        "Memory": 0
        "MemorySwap": 0
        "AttachStdin": false
        "AttachStdout": true
        "AttachStderr": true
        "PortSpecs": if params.port then [ params.port ] else null
        "Tty": false
        "OpenStdin": false
        "StdinOnce": false
        "Env": null
        "Cmd": params.command.split(' ')
        "Dns": null
        "Image": "base"
        "Volumes": {}
        "VolumesFrom": ""
      (err, response, body) ->
        if err || response.statusCode != 201
          console.log response.statusCode + " : " + util.inspect(body, false, null)
          cb(null, err)
        else
          Container.find body.Id, (container, err) ->
            request.post
              url: endpoint.getUrl "start", "docker", container.Id
              (err, response, body) ->
                cb(container, null)

  @destroy: (name, cb) ->
    console.log endpoint.getUrl "destroy", "docker", name
    request.del
      url: endpoint.getUrl "destroy", "docker", name
      (err, response, body) ->
        if err || response.statusCode != 204
          console.log response.statusCode + " : " + util.inspect(body, false, null)
          cb(body)
        else
          cb(null)

module.exports = Container
