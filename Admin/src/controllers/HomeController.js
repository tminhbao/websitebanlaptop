const ProductModel = require('../models/product');
class HomeController {
    index(req, res) {
        let listPro = ProductModel.list();
        res.render('home',{listPro:listPro});
    }
}
exports.getAll = (req,res) => {
    console.log('Data is here');
    ProductModel.getAll((err,product)=>{
        console.log('We are here');
    })
}
module.exports = new HomeController;