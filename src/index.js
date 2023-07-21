import * as dotenv from "dotenv";
dotenv.config();

import express from "express";
import cors from "cors";
import morgan from "morgan";

import bookRouter from "../src/book/book.route.js";
import userRouter from "../src/user/user.route.js";
import routerAddress from "../src/adresses/adresses.route.js";
import favoritesRouter from "../src/favorites/favorites.route.js";
import cartRouter from "../src/cart/cart.route.js";
import seedRouter from "../src/seed/seed.route.js";

export const app = express();

app.use(cors());
app.use(express.json());
app.use(morgan("dev"));

app.use("/seed", seedRouter);
app.use("/api/v1", bookRouter);
app.use("/api/v1", userRouter);
app.use("/api/v1", routerAddress);
app.use("/api/v1", favoritesRouter);
app.use("/api/v1", cartRouter);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log("servidor listo en http://localhost:" + PORT + "/api/v1");
});
