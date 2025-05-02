const jwt = require('jsonwebtoken');

const validatorJwt = (req, res, next) => {
    
    try {
        const token = req.header('x-token');
        if (!token) {
            throw new Error('token vacio')
        }
        const {uuid} = jwt.verify(token, process.env.JKT_KEY);
        req.uuid = uuid;
        console.error(uuid)
        next();
    } catch (error) {
        console.error(error.message)
        return res.status(401).json({
            ok: false,
            msg: 'no autorizado'
           });
    }
}

module.exports = {
    validatorJwt
}