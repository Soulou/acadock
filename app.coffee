express = require 'express'

app = express()
app.use express.bodyParser()
app.use require('connect-assets')()

http = require 'http'
server = http.createServer app
io = require('socket.io').listen server

# Acadock classes

Container = require './lib/models/container'
urlHelper = require './lib/helpers/urlHelper'
app.get '/', (req, res) ->
  Container.findAll (containers, err) ->
    if !err
      res.render 'index.jade', { containers: containers }
    else
      res.status 400
      res.send(err)

app.get '/containers/new', (req, res) ->
    res.render 'containers/new.jade'

app.post '/containers/create', (req,res) ->
  if !req.body.container
    res.status 422
    res.end()
  else
    Container.create req.body.container, (container) ->
      if !container
        res.redirect('/containers/new')
      else
        res.redirect('/')

app.get '/containers/:name', (req, res) ->
  Container.find req.params.name, (container, err) ->
    if !err
      res.render 'containers/show.jade', {container: container}
    else
      res.status 422
      res.end(err)

server.listen(process.env.PORT || 3000)
