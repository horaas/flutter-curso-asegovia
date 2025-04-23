

class Socket {
    constructor(server) {
        this.io = require('socket.io')(server);
    }

    handleProcessIo() {
        this.io.on('connection', (client) => this.handleConection(client));
    }

    handleConection(client){
        console.dir('conectado')
        client.on('disconnect', () => this.handleDisconect());
        this.handleMessage(client)
    }
    handleDisconect(){
        console.dir('desconectado')
    }
    handleMessage(client){
        console.dir(client.id)
        client.on('message', (data) => {
            console.log('reciver: ', data)
            this.io.emit('message', {success: true});
        });
    }
}

module.exports = {
    create: (server) => new Socket(server)
}
