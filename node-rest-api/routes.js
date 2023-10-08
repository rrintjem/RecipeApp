const express = require('express');
const router = express.Router();

router.get('/', async function(req,res){
    let body = req.body;
    let result = {"Test":"Response"};
   
    try {
     res.status(200).json(result);
    } catch(error) {
     res.status(500).end();
    }
});

module.exports = router;