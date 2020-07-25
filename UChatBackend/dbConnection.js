var MongoClient = require("mongodb").MongoClient;
const dbTables = require("./tables");
var url = dbTables.Endpoint;

//Create Database Connection
MongoClient.connect(url + dbTables.DatabaseName, function (err, db) {
  if (err) {
    throw err;
  }
  console.log("Databse Created!");
  db.close();
});

//Create Collections
MongoClient.connect(url, function (err, db) {
  if (err) throw err;
  var uchatDB = db.db(dbTables.DatabaseName);

  //Adding User Collection
  uchatDB.createCollection(dbTables.UserTable, function (err, res) {
    if (err) throw err;
    console.log("User Collection Created");
  });

  db.close();
});
