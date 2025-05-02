const { Router } = require("express");
const { validatorJwt } = require("../middlewares/validatorJWT");
const { getMessages } = require("../02_controllers/mesages");

const messageRoutes = Router();

messageRoutes.get('/:to', validatorJwt , getMessages)

module.exports = {messageRoutes}