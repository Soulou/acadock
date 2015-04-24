endpoints_info = {

  "lxcresources" : {
    "url" : "http://" + (process.env.LXC_RESOURCES_HOST || "localhost"),
    "port" : (process.env.LXC_RESOURCES_PORT || 4244),
    "endpoints" : {
      "net" : "/containers/#NAME#/net",
      "mem" : "/containers/#NAME#/mem",
      "cpu" : "/containers/#NAME#/cpu"
    }
  },
  "docker" : {
    "url" : "http://" + (process.env.DOCKER_HOST || "localhost"),
    "port" : (process.env.DOCKER_PORT || 4243),
    "endpoints" : {
      "list" : "/containers/ps?all=1",
      "inspect" : "/containers/#NAME#/json",
      "create" : "/containers/create",
      "destroy" : "/containers/#NAME#",
      "attach" : "/containers/#NAME#/attach?logs=1&stream=0&stdout=1&stderr=1",
      "start" : "/containers/#NAME#/start"
    }
  }
}

class Endpoint
  @getUrl: (endpoint, service, name) ->
    url = endpoints_info[service]["url"] + ":" + endpoints_info[service]["port"] + endpoints_info[service]["endpoints"][endpoint]
    if name
      url = url.replace("#NAME#", name)
    url
  @infos: ->
    endpoints_info

module.exports = Endpoint
