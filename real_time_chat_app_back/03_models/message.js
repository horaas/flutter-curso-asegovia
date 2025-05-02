const { Schema, model } = require("mongoose");

const MenssageSchema = Schema({
    from: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    to: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    message: {
        type: String,
        required: true
    },
}, {
    timestamps: true
});

MenssageSchema.method('toJSON', function() {
    const {__v, _id, ...object} = this.toObject();

    return object;
});

module.exports = model('Message', MenssageSchema)