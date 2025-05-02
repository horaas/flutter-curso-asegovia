const User = require("../03_models/user");


const getUsers = async (req, res) => {
    try {
        const from = Number(req.query.from) || 0;
        console.error(from)

        const users = await User.find({_id: {$ne: req.uuid}}).sort('-online').skip(from).limit(20);
        res.json({
            ok: true,
            users
        });
    } catch (error) {
        res.status(500).json({
            ok: false,
            msg: 'error'
        })
    }
}


module.exports = {
    getUsers
};