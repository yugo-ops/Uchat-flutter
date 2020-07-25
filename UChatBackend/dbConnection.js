var MongoClient = require("mongodb").MongoClient;
var url = "mongodb://localhost:27017/";

//Create Database Connection
MongoClient.connect(url + "uchat", function (err, db) {
  if (err) {
    throw err;
  }
  console.log("Databse Created!");
  db.close();
});

//Create Collections
MongoClient.connect(url, function (err, db) {
  if (err) throw err;
  var uchatDB = db.db("uchat");

  //Adding User Collection
  uchatDB.createCollection("users", function (err, res) {
    if (err) throw err;
    console.log("User Collection Created");
  });
});
