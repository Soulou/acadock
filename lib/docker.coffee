docker_info = {
  "url" : "http://" + process.env.DOCKER_HOST,
  "port" : process.env.DOCKER_PORT,
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
