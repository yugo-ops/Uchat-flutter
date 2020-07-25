const express = require("express");
const router = express.Router();

var Response = {
  ResponseCode: String,
  ResponseMessage: String,
  ResponseObject: Object,
};
router.get("/", (req, res) => {
  console.log("It hit root controller");
  (Response.ResponseCode = "00"), (Response.ResponseMessage = "It got here");
  res.json(Response);
});

module.exports = router;
