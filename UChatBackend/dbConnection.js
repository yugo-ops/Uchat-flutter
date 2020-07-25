var MongoClient = require("mongodb").MongoClient;
const dbTables = require("./tables");
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
  uchatDB.createCollection(dbTables.UserTable, function (err, res) {
    if (err) throw err;
    console.log("User Collection Created");
  });

  module.exports = uchatDB;
});
