const ProductModel = require("../../models/product");
class ShopController {
    index(req, res) {
        let listPro = ProductModel.list();
        res.render('shop-left-sidebar',{listPro:listPro});
    }
}

exports.getAll = (req, res) => {
    console.log('Data is here');
    ProductModel.getAll((err, product) => {
        console.log('We are here');
    })
}
module.exports = new ShopController;