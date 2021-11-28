const express = require('express')
const handlebars = require('express-handlebars');
const hbs = handlebars.create({ extname: '.hbs' })
const app = express()
const port = 3000
const route = require('./src/routes/index');
const bodyParser = require('body-parser');

// Paginate
const paginateHelper = require('express-handlebars-paginate')
// const Handlebars = require("handlebars");
// Handlebars.registerHelper('paginate', paginateHelper);
hbs.handlebars.registerHelper('paginateHelper', paginateHelper.createPagination);
// Paginate

app.engine('hbs', hbs.engine)
app.set('view engine', 'hbs');
const path = require('path');
const Product = require('./src/models/product');
app.set("views", path.join(__dirname, 'src/resources/views'));

app.use(express.static('src/public'));



route(app);

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

const mysql = require('mysql');
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'admin',
  database: 'laptop_webshop',
  charset: 'utf8_general_ci',
  port: '3306'
});

conn.connect(function (err) {
  if (err)
    throw err;
})

var pool  = mysql.createPool({
  connectionLimit : 10,
  host: "localhost",
  user: "root",
  password: "admin",
  database: "mytestdb",
  multipleStatements: true
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})













