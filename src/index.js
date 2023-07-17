import * as dotenv from "dotenv";
dotenv.config();

import express from "express";
import cors from "cors";
export const app = express();

import bookRouter from "../src/book/book.route.js"
import userRouter from "../src/user/user.route.js"

app.use(cors());
app.use(express.json());
app.use("/api/v1", bookRouter)
app.use("/api/v1", userRouter)

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log("servidor listo en http://localhost:" + PORT + "/api/v1");
});