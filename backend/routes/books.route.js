const router = require('express').Router();
let bookData = require("../models/book.model");
require('dotenv').config();

router.route('/addBook').post((req,res)=>{
    // add book api created just to add some sample book data
    // added a simple secret verification as it is used internally
    if(req.headers['api-secret'] != process.env.INTERNAL_API_SECRET){
        res.status(401).json('Error: Unauthorised');
    }

    const title = req.body.title;
    const author = req.body.author;
    const genre = req.body.genre;
    const coverImage = req.body.coverImage;
    const price = Number(req.body.price);
    const rating = Number(req.body.rating);
    const pageCount = Number(req.body.pageCount);
    const about = req.body.about;
    const additionalData = req.body.additionalData;
    const category = req.body.category;
    const contentLink = req.body.contentLink;


    const newBook = new bookData({
       title,
       author,
       genre,
       coverImage,
       price,
       rating,
       pageCount,
       about,
       additionalData,
       category,
       contentLink
    });
    newBook.save()
    .then(() => res.json('Book added!'))
    .catch(err => res.status(400).json('Error: ' + err));
});

module.exports = router;