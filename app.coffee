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

app.get '/containers/new', (req, res) ->
    res.render 'containers/new'

app.post '/containers/create', (req,res) ->
  if !req.body.container
    res.status(422)
    res.end()
  else
    Container.create req.body.container, (container) ->
      if !container
        res.redirect('/containers/new')
      else
        res.redirect('/')


server.listen(process.env.PORT || 3000)
