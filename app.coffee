express = require 'express'

app = express()
app.use express.bodyParser()
app.use require('connect-assets')()

http = require 'http'
server = http.createServer app
io = require('socket.io').listen server
io.set "log level", 1

_ = require "underscore"

# Acadock classes

Container = require './lib/models/container'
urlHelper = require './lib/helpers/urlHelper'
websocket = require './lib/websocket'


app.get '/', (req, res) ->
  console.log("List all containers")
  Container.findAll (containers, err) ->
    if !err
      res.render 'index.jade', { containers: containers }
    else
      res.status 400
      res.send(err)

app.get '/containers/new', (req, res) ->
  console.log("Create container")
  res.render 'containers/new.jade'

app.post '/containers/create', (req,res) ->
  console.log("Create container")
  if !req.body.container
    res.status 422
    res.end()
  else
    Container.create req.body.container, (container, err) ->
      if container
        res.send(container)
      else
        res.status(422)
        res.end()

app.delete '/containers/:name', (req, res) ->
  console.log("Delete Container")
  Container.destroy req.params.name, (err) ->
    if !err
      res.status(200)
      res.end()
    else
      res.status(422)
      res.end()

app.get '/containers/:name', (req, res) ->
  console.log("Inspect container")
  websocket io, req.params.name
  Container.find req.params.name, (container, err) ->
    if !err
      res.render 'containers/show.jade', {container: container, _: _}
    else
      res.status 422
      res.end(err)

app.get '/containers/:name/attach', (req, res) ->
  console.log("Attach container")
  Container.attach req.params.name, res

app.all "*", (req, res) ->
  console.log(req.method + req.path)
  res.end()


server.listen(process.env.PORT || 3000)
