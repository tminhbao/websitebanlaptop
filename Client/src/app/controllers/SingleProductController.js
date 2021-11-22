class SingleProductController {
    index(req,res) {
        res.render('single-product');
    }
}
module.exports = new SingleProductController;