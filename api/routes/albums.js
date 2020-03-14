const express = require('express');
const router = express.Router();

router.get('/', (req, res, next) => {
    const album ={
        title : req.body.title,
        artist : req.body.artist
    };
    res.status(200).json({
        message : 'Handle GET requests to /albums',
        gotAlbums : album
    });
});


router.get('/:title', (req, res, next) => {
    // find albums in database by titles
    const title = req.params.title;
    const queryString = 'SELECT * FROM albums WHERE title = ?';
    
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
                message : 'failed to query for albums'
            });
        } 
        res.json(rows);
    });
});


module.exports = router;