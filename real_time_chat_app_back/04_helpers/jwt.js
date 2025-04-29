const jwt = require('jsonwebtoken');

const generate = (uuid) => {
    return new Promise((resolve, reject) => {
        
        const payload = {uuid}
    
        jwt.sign(payload, process.env.JKT_KEY, {
            expiresIn: '48h',
        }, (error, token) => {
            if (error) {
                reject(new Error("Error key"));
            };
            resolve(token);
        });
    });

}

module.exports = {generate}