express = require 'express'

app = express()
app.use express.bodyParser()
app.use require('connect-assets')()

http = require 'http'
server = http.createServer app
io = require('socket.io').listen server

# Acadock classes 
Container = require './lib/models/container'

app.get '/', (req, res) ->
  Container.findAll (container, err) ->
    if err != null
      res.render 'index.jade'
    else 
      res.status(400)



server.listen(process.env.PORT || 3000)
