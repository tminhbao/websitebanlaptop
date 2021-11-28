const ProductModel = require("../../models/product");
class ShopLeftSidebarController {
    index(req, res) {
        let listPro = ProductModel.list();
        res.render('shop-left-sidebar',{listPro,pagination: { page: 1, limit:5,totalRows:5,queryParams: listPro }});
    }
}
exports.getAll = (req, res) => {
    console.log('Data is here');
    ProductModel.getAll((err, product) => {
        console.log('We are here');
    })
}
module.exports = new ShopLeftSidebarController;