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

// router.post('/', (req, res, next) => {
//     res.status(200).json({
//         message : 'Handle POST requests to /albums'
//     });
// });

// router.patch('/', (req, res, next) => {
//     res.status(200).json({
//         message : 'Handle PATCH requests to /albums'
//     });
// });

// router.delete('/', (req, res, next) => {
//     res.status(200).json({
//         message : 'Handle DELETE requests to /albums'
//     });
// });

module.exports = router;