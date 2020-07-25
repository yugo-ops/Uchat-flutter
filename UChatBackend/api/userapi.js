const express = require("express");
const userObject = require("../models/user");
const router = express.Router();
const dbTables = require("../tables");
var MongoClient = require("mongodb").MongoClient;

var Response = {
  ResponseCode: String,
  ResponseMessage: String,
  ResponseObject: Object,
};

router.post("/register", (req, res) => {
  //Fetch Data From Request Payload
  const firstName = req.body.FirstName;
  const lastName = req.body.LastName;
  const userName = req.body.UserName;
  const password = req.body.Password;
  const phoneNumber = req.body.PhoneNumber;
  const pin = req.body.Pin;

  //Perform Validations
  if (firstName == null) {
    Response.ResponseCode = "01";
    Response.ResponseMessage = "First Name Is Required";
    res.json(Response);
    return;
  }

  if (lastName == null) {
    Response.ResponseCode = "02";
    Response.ResponseMessage = "Last Name Is Required";
    res.json(Response);
    return;
  }

  if (userName == null) {
    Response.ResponseCode = "03";
    Response.ResponseMessage = "User Name Is Required";
    res.json(Response);
    return;
  }

  if (password == null) {
    Response.ResponseCode = "04";
    Response.ResponseMessage = "Password Is Required";
    res.json(Response);
    return;
  }

  if (phoneNumber == null) {
    Response.ResponseCode = "05";
    Response.ResponseMessage = "Phone Number Is Required";
    res.json(Response);
    return;
  }

  if (pin == null) {
    Response.ResponseCode = "06";
    Response.ResponseMessage = "Pin Is Required";
    res.json(Response);
    return;
  }

  //Create User Object
  userObject.FirstName = firstName;
  userObject.LastName = lastName;
  userObject.Username = userName;
  userObject.Password = password;
  userObject.Pin = pin;
  userObject.PhoneNumber = phoneNumber;

  //Save To Database
  MongoClient.connect(dbTables.Endpoint, (err, db) => {
    if (err) {
      Response.ResponseCode = "07";
      Response.ResponseMessage = err.message;
      res.json(Response);
      return;
    }

    var uchatDB = db.db(dbTables.DatabaseName);
    uchatDB
      .collection(dbTables.UserTable)
      .insertOne(userObject, (insertErr, data) => {
        if (insertErr) {
          Response.ResponseCode = "08";
          Response.ResponseMessage = insertErr.message;
          res.json(Response);
          return;
        }

        Response.ResponseCode = "00";
        Response.ResponseMessage = "Registeration Successful!";

        res.json(Response);
        return;
      });
  });
});

router.post("/authenticateUser", (req, res) => {
  const username = req.body.UserName;
  const password = req.body.Password;

  userObject.Username = username;
  userObject.Password =password;

  if(username == null || password == null){
    Response.ResponseCode = "-01";
    Response.ResponseMessage = "Incomplete Credentials Passed.";
    res.json(Response);
    return;
  }

  //Connect To The Database Server
  MongoClient.connect(dbTables.Endpoint, (err, db) => {
    if (err) {
      Response.ResponseCode = "07";
      Response.ResponseMessage = err.message;
      res.json(Response);
      return;
    }
    var uchatDB = db.db(dbTables.DatabaseName);
    console.log("gOT HERE 1")
    uchatDB.collection(dbTables.UserTable).findOne(userObject, (err, data) => {
      if(err){
        Response.ResponseCode = "08";
        Response.ResponseMessage = err.message;
         res.json(Response);
        return;
      }

      console.log("got here 2")

      console.log(data);
      if(data == null){
      Response.ResponseCode = "09";
      Response.ResponseMessage = "User does not exist";
      res.json(Response);
      return;
      }

      Response.ResponseCode = "00";
      Response.ResponseMessage = "Authentication Successful";
      Response.ResponseObject = data;
      res.json(Response);
      return;
    })
  })
  //Connect To The Database  
  //Check If Record Exists On User Table
  //    If yes => Send the user record back to the client with response code 00
  //    If no => Send the failed response back to the client

})

module.exports = router;
