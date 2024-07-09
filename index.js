import express from "express";
import userRouter from "./routes/users.js";
const app = express();


app.use("/api/users", userRouter);


app.listen(8800, ()=>{

    console.log("API is working");
})

