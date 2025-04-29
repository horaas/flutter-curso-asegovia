const {
    response
} = require("express");

const bcrypt = require('bcryptjs');


const User = require("../03_models/user");
const { generate } = require("../04_helpers/jwt");

const create = async (req, res = response) => {
    
    try {
        const { email, pass } = req.body;
        const existEmail = await User.findOne({email: email});
        if (existEmail) {
            throw new Error('email existe')
        }
        const user = new User(req.body);
        //Json web tojken
        const token = await generate(user.id);
        
        //encript contraseña
        const salt = bcrypt.genSaltSync();
        user.pass = bcrypt.hashSync(pass, salt);

        await user.save();

        res.json( {
            ok: true,
            user,
            token
        })
    } catch (error) {
        console.error(error.message)
        res.status(500).json( {
            ok: false,
            msg: 'error'
        })
    }
}


module.exports = {
    create
}