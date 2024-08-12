const express = require('express');
const router = express.Router();
const pr2Controller = require('../controllers/pr2Controller');

router.get('/', pr2Controller.welcome);

module.exports = router;
