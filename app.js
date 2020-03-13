const express = require('express');
const app = express();

const songRoutes = require('./api/routes/songs');
const albumRoutes = require('./api/routes/albums');

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