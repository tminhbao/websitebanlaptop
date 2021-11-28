const db = require('../models/connect');
var dataList = [];
var dataName = [];
exports.list = () => {
    let sql = 'SELECT * FROM laptop';
    let query = db.query(sql,(err,result) =>{
        dataList = result;
    })
    return dataList;
}