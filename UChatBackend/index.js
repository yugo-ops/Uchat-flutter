const express = require("express");
const http = require("http");
const cors = require("cors");
const bodyparser = require("body-parser");
const methodOverride = require("method-override");
const dbConnection = require("./dbConnection");
const rootApi = require("./api/rootapi");
// const userApi = require("./api/userapi");

//setting up environment
var app = express();
app.use(bodyparser.json());
app.use(bodyparser.urlencoded());
app.use(methodOverride());
//app.use(cors({origin: "http"}));
http.createServer(app).listen(9000, () => {
  console.log("Server start on port 9000");
});

app.use("/", rootApi);
// app.use("/user", userApi);
