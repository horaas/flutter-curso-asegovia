

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
        this.handleGetBands(client)
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
    handleGetBands(client){
        console.dir(client.id)
        client.on('bands', (data) => {
            console.log('reciver: ', data)
            if(data.get) {
                this.io.emit('getBands', {bands: [
                    {id: 3, name: 'par band', votes: 40, color: 'Colors.blueAccent'},
                    {id: 1, name: 'kiss', votes: 10, color: 'Colors.red'},
                    {id: 2, name: 'bon jovi', votes: 5, color: 'Colors.green'},
                  ]});
            }
            
        });
    }
}

module.exports = {
    create: (server) => new Socket(server)
}
