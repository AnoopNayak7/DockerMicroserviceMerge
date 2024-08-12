const express = require('express');
const router = express.Router();
const pr1Controller = require('../controllers/pr1Controller');

router.get('/', pr1Controller.welcome);

module.exports = router;
