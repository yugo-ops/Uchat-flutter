const express = require("express");
const router = express.Router();

var Response = {
  ResponseCode: String,
  ResponseMessage: String,
  ResponseObject: Object,
};

router.get("/register", (req, res) => {
  Response.ResponseCode = "00";
  Response.ResponseMessage = "Register";

  res.json(Response);
  return;
});
