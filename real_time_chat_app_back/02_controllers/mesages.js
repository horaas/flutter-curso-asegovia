const Message = require("../03_models/message");


const getMessages = async (req, res) => {
    try {
        const to = req.params.to;
        console.error(to)
        console.error(req.uuid)
        const from = req.uuid;

        const messages = await Message.find({$or: [{from: from, to: to}, {from: to, to: from}]}).sort({createdAt: 'desc'}).limit(20);
        res.json({
            ok: true,
            messages
        });
    } catch (error) {
        res.status(500).json({
            ok: false,
            msg: 'error'
        })
    }
}


module.exports = {
    getMessages
};