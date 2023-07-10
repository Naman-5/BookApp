const router = require("express").Router();
let bookData = require("../models/book.model");

require("dotenv").config();

router.route("/").get(async (req, res) => {
  let controller = new HomeController();
  try {
    res.json({
      message: "Home Page response",
      data: {
        Books: [
          {
            header: "Top Sellers",
            bookList: await controller.getTopSellers(),
          },
          {
            header: "New Releases",
            bookList: await controller.getNewReleases(),
          },
          {
            header: "Sci-Fi & Fantacy",
            bookList: await controller.getSciFi()
          }
        ],
      },
    });
  } catch (err) {
    res.status(500).json("Error: " + err);
  }
});

class HomeController {
  /*
    categories
    TS - Top Seller
    NR - New Releases
    SF - Sci-Fi
     */
  getTopSellers() {
    return bookData.find({ category: "TS" });
  }

  getNewReleases() {
    return bookData.find({ category: "NR" });
  }

  getSciFi(){
    return bookData.find({category:"SF"});
  }
}
module.exports = router;
