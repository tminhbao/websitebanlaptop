const express = require('express');
const router = express.Router();
const shopLeftSidebarController = require('../app/controllers/ShopLeftSidebarController');
router.use('/',shopLeftSidebarController.index);
module.exports = router;