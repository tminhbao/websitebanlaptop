const db = require('../database/connect');
var laptopList = [];

exports.list = () => {
    let sql = 'SELECT laptop_id, mn.manufacture_name, md.model_name, lt.laptop_name, lt.laptop_cpu, lt.laptop_ram, lt.laptop_vga, lt.laptop_disk, lt.cost, lt.price, lt.inventory FROM laptop lt JOIN manufacture mn ON lt.manufacture = mn.manufacture_id join model md ON lt.model = md.model_id';
    let query = db.query(sql,(err,result) =>{
        laptopList = result;
    })
    return laptopList;
}

exports.add = (data) => {
    var values = [
        [data.laptop_id, data.manufacture, data.model, data.laptop_name, '', data.laptop_cpu, data.laptop_ram, data.laptop_vga, data.laptop_disk, data.image, data.cost, data.price, data.inventory]
    ]

    let insert_laptop_sql = 'INSERT INTO laptop(laptop_id, manufacture, model, laptop_name, laptop_description, laptop_cpu, laptop_ram, laptop_vga, laptop_disk, image, cost, price, inventory) VALUES ?'
    let query = db.query(insert_laptop_sql,[values],(err,result) => {
        if (err) throw err;
        console.log("Number of records inserted: " + result.affectedRows);
    })
}

exports.delete = (id) => {
    let delete_laptop_sql = 'DELETE FROM laptop WHERE laptop_id = ?';
    let query = db.query(delete_laptop_sql, id,(err,result) => {
        if (err) throw err;
        console.log("Number of records deleted: " + result.affectedRows);
    })
}