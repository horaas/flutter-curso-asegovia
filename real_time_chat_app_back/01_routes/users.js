const { Router } = require("express");
const { validatorJwt } = require("../middlewares/validatorJWT");
const { getUsers } = require("../02_controllers/users");

const usersRoutes = Router();

usersRoutes.get('/', validatorJwt , getUsers)

module.exports = {usersRoutes}