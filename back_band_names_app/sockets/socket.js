const Band = require('../models/band');
const Bands = require('../models/bands');

const bands = new Bands();

bands.addBand( new Band('par band'),)
bands.addBand( new Band('kiss'),)
bands.addBand( new Band('bon jovi'),)
bands.addBand( new Band('bon nuevo jovi'),)
bands.addBand( new Band('bon nuevo jovi'),)

class Socket {
    constructor(server) {
        this.io = require('socket.io')(server);
        this.client = undefined;
    }

    handleProcessIo() {
        this.io.on('connection', (client) => this.handleConection(client));
    }

    handleConection(client) {
        console.dir('conectado');
        console.dir(client.id);
        this.client = client
        client.on('disconnect', () => this.handleDisconect());
        this.handleVoteBand();
        this.handleGetBands();
    }
    handleDisconect() {
        console.dir('desconectado');
    }
    handleGetBands() {
        this.client.emit('getBands', bands.getBands());
    }
    handleVoteBand() {
        this.client.on('vote-band', (data) => {
            console.log('reciver: ', data);
            bands.voteBand(data.id);
            console.table(bands.getBands())
            this.io.emit('getBands', bands.getBands());
        });
    }
    // handleMessage() {
    //     this.client.on('message', (data) => {
    //         console.log('reciver: ', data);
    //         client.broadcast.emit('message', {
    //             success: true
    //         });
    //     });
    // }
}

module.exports = {
    create: (server) => new Socket(server)
}