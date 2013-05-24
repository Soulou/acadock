express = require 'express'

app = express()
app.use express.bodyParser()
app.use require('connect-assets')()

http = require 'http'
server = http.createServer app
io = require('socket.io').listen server

logger = (req, res, next) ->
  console.log req.body
  next()

app.use logger

app.get '/', (req, res) ->
  res.render 'index.jade'


server.listen(process.env.PORT || 3000)
