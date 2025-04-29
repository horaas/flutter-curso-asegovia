const mongoose = require('mongoose');

const dbConnection = async () => {
    try {
        await mongoose.connect(process.env.DB);
        console.dir('oline')
    } catch (error) {
        throw new Error('error en base');
    }
}

module.exports = {
    dbConnection
}