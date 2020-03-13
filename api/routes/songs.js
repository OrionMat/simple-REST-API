const express = require('express');
const router = express.Router();

router.get('/', (req, res, next) => {
    res.status(200).json({
        message : 'Handle GET requests to /songs'
    });
});

// router.post('/', (req, res, next) => {
//     res.status(200).json({
//         message : 'Handle POST requests to /songs'
//     });
// });

// router.patch('/', (req, res, next) => {
//     res.status(200).json({
//         message : 'Handle PATCH requests to /songs'
//     });
// });

// router.delete('/', (req, res, next) => {
//     res.status(200).json({
//         message : 'Handle DELETE requests to /songs'
//     });
// });

module.exports = router;