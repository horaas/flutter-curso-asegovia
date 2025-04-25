const express = require('express');
const path = require('path');
require('dotenv').config();

//init app express
const app = express();
app.use(express.static('./public'))

//server node socket
const server = require('http').createServer(app);
const socket = require('./sockets/socket');

socket.create(server).handleProcessIo();


server.listen(process.env.PORT, () => {
    console.log(`Example app listening on port ${process.env.PORT}`)
})