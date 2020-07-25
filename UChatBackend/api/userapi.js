const express = require("express");
const userObject = require("../models/user");
const router = express.Router();
const uchatDB = require("../dbConnection");
const dbTables = require("../tables");

var Response = {
  ResponseCode: String,
  ResponseMessage: String,
  ResponseObject: Object,
};

router.get("/register", (req, res) => {
  //Fetch Data From Request Payload
  const firstName = req.body.FirstName;
  const lastName = req.body.LastName;
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

  if (password == null) {
    Response.ResponseCode = "03";
    Response.ResponseMessage = "Password Is Required";
    res.json(Response);
    return;
  }

  if (phoneNumber == null) {
    Response.ResponseCode = "04";
    Response.ResponseMessage = "Phone Number Is Required";
    res.json(Response);
    return;
  }

  if (pin == null) {
    Response.ResponseCode = "05";
    Response.ResponseMessage = "Pin Is Required";
    res.json(Response);
    return;
  }

  //Create User Object
  userObject.FirstName = firstName;
  userObject.LastName = lastName;
  userObject.Password = password;
  userObject.Pin = pin;
  userObject.PhoneNumber = phoneNumber;

  //Save To Database
  uchatDB.collection(dbTables.UserTable).insertOne(userObject, (err, resp) => {
    if (err) {
      Response.ResponseCode = "06";
      Response.ResponseMessage = err.message;
      res.json(Response);
      return;
    }

    Response.ResponseCode = "00";
    Response.ResponseMessage = "Register";

    res.json(Response);
    return;
  });
});

module.exports = router;
