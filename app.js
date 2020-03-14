// importing libraries
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

const songRoutes = require('./api/routes/songs');
const albumRoutes = require('./api/routes/albums');

// database connection
var mysql = require("mysql");
app.use(function(req, res, next){
	res.locals.connection = mysql.createConnection({
		host     : 'localhost',
		user     : 'root',
		password : '',
		database : 'musicdatabase'
	});
	res.locals.connection.connect();
	next();
});

// url and json bodys can be parsed
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use('/songs', songRoutes);
app.use('/albums', albumRoutes);

// error handeling
app.use((req, res, next) => {
    const error = new Error('Error Occured');  
    // 404 code is used if didn't find a route  
    error.status = 404;
    next(error);
});

// error catching for problems in database 
app.use((error, req, res, next) => {
    res.status(error.status || 500);
    res.json({
        error: {
            message : error.message 
        }
    })
});

module.exports = app;