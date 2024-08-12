const express = require('express');
const router = express.Router();
const pr4Controller = require('../controllers/pr4Controller');

router.get('/', pr4Controller.welcome);

module.exports = router;
