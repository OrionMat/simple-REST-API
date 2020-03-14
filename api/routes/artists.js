const express = require('express');
const router = express.Router();
const mysql = require('mysql');

router.get('/', (req, res, next) => {
    const artist ={
        name : req.body.name,
        artist : req.body.artist
    };
    res.status(200).json({
        message : 'Handle GET requests to /artists',
        gotartists : artist
    });
});

router.get('/:name', function(req, res, next) {
    // find artists in database by names
    const name = req.params.name;
    const queryString = 'SELECT * FROM artists WHERE name = ?';
	res.locals.connection.query(queryString, [name], function (error, rows, fields) {
		if (error){
            res.status(500).json({
                message : 'failed to query for artists'
            });
        } 
        res.json(rows);
	});
});

module.exports = router;