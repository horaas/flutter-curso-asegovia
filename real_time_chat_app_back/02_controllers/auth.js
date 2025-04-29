const {
    response
} = require("express");

const create = (req, res = response) => {
    console.error('hola')
    // console.error(this.user, this.pass);
    res.json( {
        ok: true,
        msg: 'crear usuario!!!'
    })
}

module.exports = {
    create
}