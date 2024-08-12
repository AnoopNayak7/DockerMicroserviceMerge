const express = require('express');
const router = express.Router();
const pr3Controller = require('../controllers/pr3Controller');

router.get('/', pr3Controller.welcome);

module.exports = router;
