const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');

require('dotenv').config();

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());

const uri = process.env.ATLAS_URI;
mongoose.connect(uri,{useNewUrlParser:true});
const connection = mongoose.connection;
connection.once('open',()=>{
    console.log('Mongo DB connected');
})
const bookRouter = require('./routes/books.route');
const homeRouter = require('./routes/home.route');
app.use('/book',bookRouter);
app.use('/home',homeRouter);

app.listen(port, ()=>{
    console.log(`Server is running on port, ${port}`);
});