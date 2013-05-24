docker_info = {
  "url" : "http://localhost",
  "port" : "4243",
  "endpoints" : {
    "list" : "/containers/ps?all=1",
    "create" : "/containers/create"
  }
}

class Docker
  @getUrl: (endpoint) ->
    docker_info.url + ":" + docker_info.port + docker_info["endpoints"][endpoint]
  @infos: ->
    docker_info

module.exports = Docker
