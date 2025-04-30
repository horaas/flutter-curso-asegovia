const User = require("../03_models/user");

const userConected = async (uuid = '', isOnline = false) => {
    const user = await User.findById(uuid);
    user.online = isOnline;
    await user.save();
    return user;
}

module.exports = {
    userConected
}