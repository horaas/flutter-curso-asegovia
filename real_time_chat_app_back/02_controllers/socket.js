const Message = require("../03_models/message");
const User = require("../03_models/user");

const userConected = async (uuid = '', isOnline = false) => {
    const user = await User.findById(uuid);
    user.online = isOnline;
    await user.save();
    return user;
}

const saveMessage = async (payload) => {
    try {
        const message = new Message(payload);
        await message.save()
    } catch (error) {
        return false;
    }
}
module.exports = {
    userConected,
    saveMessage
}