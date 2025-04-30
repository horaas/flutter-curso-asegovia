const { userConected } = require('../02_controllers/socket');
const { validateJWT } = require('../04_helpers/jwt');
const Band = require('../models/band');
const Bands = require('../models/bands');

const bands = new Bands();

bands.addBand( new Band('par band'),)
bands.addBand( new Band('kiss'),)
bands.addBand( new Band('bon jovi'),)
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
        console.dir('id-client-socket');
        console.dir(client.id);
        const [ isValid, uuid] = validateJWT(client.handshake.headers['x-token'])
        if (!isValid) {
            return client.disconnect();
        }
        console.dir('conectado');
        userConected(uuid, true);
        this.client = client;

        this.client.join(uuid);

        this.listenPersonalMessage();
        client.on('disconnect', () => this.handleDisconect(uuid));
    }
    handleDisconect(uuid) {
        userConected(uuid, false);
        console.dir('desconectado');
    }
    listenPersonalMessage() {
        this.client.on('personal-message', (data) => {
            console.log('personal-message: ', data);
        });
    }
    handleGetBands() {
        this.client.emit('getBands', bands.getBands());
    }
    handleVoteBand() {
        this.client.on('vote-band', (data) => {
            console.log('vote: ', data);
            bands.voteBand(data.id);
            this.io.emit('getBands', bands.getBands());
        });
    }
    handleAddBand() {
        this.client.on('add-band', (data) => {
            console.log('add: ', data);
            bands.addBand(new Band(data.name));
            this.io.emit('getBands', bands.getBands());
        });
    }
    handleRemoveBand() {
        this.client.on('delete-band', (data) => {
            console.log('delete: ', data);
            bands.deleteBand(data.id);
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