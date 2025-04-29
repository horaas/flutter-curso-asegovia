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
const auth = async (req, res = response) => {
    
    try {
        const { email, pass } = req.body;
        const user = await User.findOne({email: email});
        if (!user) {
            throw new Error('Verificar datos', {cause: 'login'})
        }
        const validatePass =  bcrypt.compareSync(pass, user.pass);
        if (!validatePass) {
            throw new Error('Verificar datos', {cause: 'login'})
        }

        //Json web tojken
        const token = await generate(user.id);

        res.json( {
            ok: true,
            user,
            token
        })
    } catch (error) {
        console.error(error.message)
        console.error(error.cause)
        res.status(error.cause === 'login'? 400 : 500).json( {
            ok: false,
            msg: error.cause === 'login'? error.message : 'error'
        })
    }
}
const renewJWT = async (req, res = response) => {
    
    try {
        const {uuid } = req;
        const user = await User.findById(uuid);
        if (!user) {
            throw new Error('Usuario no existe')
        }
        const token = await generate(uuid);
        res.json( {
            ok: true,
            user,
            token
        })
    } catch (error) {
        console.error(error.message)
        res.status( 500).json( {
            ok: false,
            msg:'error'
        })
    }
}


module.exports = {
    create,
    auth,
    renewJWT
}