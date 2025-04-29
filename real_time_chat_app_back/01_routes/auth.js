const { Router } = require("express");
const { check } = require("express-validator");
const { create, auth } = require("../02_controllers/auth");
const { validator } = require("../middlewares/validators");

const routes = Router();

routes.post('/new', [
    check('name', 'el nombre es requirido').not().isEmpty(),
    check('email', 'el email requerido').isEmail(),
    check('pass', 'la contraseña es requrida').not().isEmpty(),
    validator
] , create)
routes.post('/auth', [
    check('email', 'el email requerido').isEmail(),
    check('pass', 'la contraseña es requrida').not().isEmpty(),
    validator
] , auth)

module.exports = {routes}