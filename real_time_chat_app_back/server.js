const express = require('express');
const path = require('path');
const cors = require('cors');
const { dbConnection } = require('./database/config');
const createServer = require('http').createServer;
const socket = require('./sockets/socket');
const { routes } = require('./01_routes/auth');

require('dotenv').config();

//init app express
const app = express();
//server node socket
const server = createServer(app)

app.use(express.static('./public'))
app.use(cors());
app.use(express.json());
dbConnection();

socket.create(server).handleProcessIo();

//routes

app.use('/api/login', routes)

server.listen(process.env.PORT, () => {
    console.log(`Example app listening on port ${process.env.PORT}`)
})