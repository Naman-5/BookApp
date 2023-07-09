const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const bookSchema = new Schema(
  {
    title: { type: String, required: true },
    author: { type: String, required: true },
    genre: { type: String, required: true },
    coverImage: { type: String, required: true },
    price: { type: Number, required: true },
    rating: { type: Number, required: true },
    pageCount: { type: Number, required: true },
    about: { type: String, required: true },
    additionalData: { type: Object, required: false },
    category: { type: String, required: true },
    contentLink: { type: String, required: true },
  },
  {
    timestamps: true,
  }
);

const bookData = mongoose.model("bookData", bookSchema);
module.exports = bookData;
