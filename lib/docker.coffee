docker_info = {
  "url" : "http://" + process.env.DOCKER_HOST,
  "port" : process.env.DOCKER_PORT,
  "endpoints" : {
    "list" : "/containers/ps?all=1",
    "inspect" : "/containers/#NAME#/json",
    "create" : "/containers/create"
  }
}

class Docker
  @getUrl: (endpoint, name) ->
    url = docker_info.url + ":" + docker_info.port + docker_info["endpoints"][endpoint]
    if name
      url = url.replace("#NAME#", name)
    url
  @infos: ->
    docker_info

module.exports = Docker
