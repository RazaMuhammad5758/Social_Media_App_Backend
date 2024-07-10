import express from "express";
import userRouter from "./routes/users.js";
import postRouter from "./routes/posts.js";
import likeRouter from "./routes/likes.js";
import commentRouter from "./routes/comments.js";
import authRouter from "./routes/auth.js";
const app = express();


app.use("/api/users", userRouter);
app.use("/api/users", postRouter);
app.use("/api/users", likeRouter);
app.use("/api/users", commentRouter);
app.use("/api/users", authRouter);



app.listen(8800, ()=>{

    console.log("API is working");
})

