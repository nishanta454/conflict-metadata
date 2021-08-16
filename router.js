const express = require('express');
const router = express.Router();
const validator = require('./validator')
const service = require('./service')

router.post('/conflict', async (req, res) => {
    let conversationId = req.header("x-grid");
    if(validator.validate(req)) {
        res.status(200)
        let response = await service.process(conversationId, req.body)
        res.send(response)
    } else {
        res.status(400)
        res.send(req.body)
    }
});

module.exports = router;