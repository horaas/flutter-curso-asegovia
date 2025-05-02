const jwt = require('jsonwebtoken');

const generate = (uuid) => {
    return new Promise((resolve, reject) => {

        const payload = {
            uuid
        }

        jwt.sign(payload, process.env.JKT_KEY, {
            expiresIn: '48h',
        }, (error, token) => {
            if (error) {
                reject(new Error("Error generate key JWT"));
            };
            resolve(token);
        });
    });

}

const validateJWT = (token) => {
    try {
        const {
            uuid
        } = jwt.verify(token, process.env.JKT_KEY);
        return [true, uuid];
    } catch (error) {
        console.error(error.message);
        return [false];
    }
}

module.exports = {
    generate,
    validateJWT
}