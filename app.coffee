express = require 'express'

app = express()
app.use express.bodyParser()
app.use require('connect-assets')()

http = require 'http'
server = http.createServer app
io = require('socket.io').listen server

# Acadock classes

docker = require './lib/docker'
Container = require './lib/models/container'
urlHelper = require './lib/helpers/urlHelper'
app.get '/', (req, res) ->
  Container.findAll (containers, err) ->
    if !err
      res.render 'index.jade', { containers: containers, urlHelper: urlHelper, docker: docker}
    else
      res.status(400)
      res.send(err)

server.listen(process.env.PORT || 3000)
