var MongoClient = require("mongodb").MongoClient;
var url = "mongodb://localhost:27017/mydb";

//Create Database Connection
MongoClient.connect(url, function(err, db){
    if(err){
        throw err;
    }
    console.log("Databse Created!");
    db.close();
})

