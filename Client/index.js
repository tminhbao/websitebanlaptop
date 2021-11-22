const express = require('express')
const handlebars = require('express-handlebars');
const hbs = handlebars.create( { extname: '.hbs'})
const app = express()
const port = 3000
const route = require('./src/routes/index');

app.engine('hbs', hbs.engine )
app.set('view engine', 'hbs');
const path = require('path');
app.set("views", path.join(__dirname, 'src/resources/views'));

app.use(express.static('src/public'));


route(app);


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})