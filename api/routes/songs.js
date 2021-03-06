const express = require('express');
const router = express.Router();
const mysql = require('mysql');

router.get('/', (req, res, next) => {
    const song ={
        title : req.body.title,
        artist : req.body.artist
    };
    res.status(200).json({
        message : 'Handle GET requests to /songs',
        gotSongs : song
    });
});

router.get('/:title', (req, res, next) => {
    // find songs in database by titles
    const title = req.params.title;
    const queryString = 'SELECT * FROM songs WHERE title = ?';
    
    // database connection
    const connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : '',
        database : 'musicdatabase'
    });
    
    connection.query(queryString, [title], (error, rows, fields) => {
		if (error){
            res.status(500).json({
                message : 'failed to query for songs'
            });
        } 
        res.json(rows);
    });
});

module.exports = router;