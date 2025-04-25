const Band = require('../models/band');
const Bands = require('../models/bands');

const bands = new Bands();

bands.addBand(
    new Band('par band'),
)
bands.addBand(
    new Band('kiss'),
)
bands.addBand(
    new Band('bon jovi'),
)
bands.addBand(
    new Band('bon nuevo jovi'),
)

console.dir(bands)
class Socket {
    constructor(server) {
        this.io = require('socket.io')(server);
    }

    handleProcessIo() {
        this.io.on('connection', (client) => this.handleConection(client));
    }

    handleConection(client) {
        console.dir('conectado');
        console.dir(client.id);
        client.on('disconnect', () => this.handleDisconect());
        this.handleMessage(client);
        this.handleGetBands(client);
    }
    handleDisconect() {
        console.dir('desconectado');
    }
    handleMessage(client) {
        client.on('message', (data) => {
            console.log('reciver: ', data);
            client.broadcast.emit('message', {
                success: true
            });
        });
    }
    handleGetBands() {
        this.io.emit('getBands', bands.getBands());
    }
}

module.exports = {
    create: (server) => new Socket(server)
}