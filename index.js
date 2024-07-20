import express from "express";
const app = express();
import userRouter from "./routes/users.js";
import postRouter from "./routes/posts.js";
import likeRouter from "./routes/likes.js";
import commentRouter from "./routes/comments.js";
import authRouter from "./routes/auth.js";
import cookieParser from "cookie-parser";
import cors from "cors";

//middlewares

app.use(express.json())
app.use(cors())
app.use(cookieParser())


app.use("/api/users", userRouter);
app.use("/api/posts", postRouter);
app.use("/api/likes", likeRouter);
app.use("/api/comments", commentRouter);
app.use("/api/auth", authRouter);



const PORT = 8800; // Change this to a different port number if needed

app.listen(PORT, () => {
    console.log(`API is working on port ${PORT}`);
});
