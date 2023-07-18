import { Router } from "express";
import { favoritesController} from "./favorites.controller.js";
import { verifyToken, verifyUser } from "../middlewares/verify.js";

const router = Router()

router.post("/user/favorites", verifyToken, favoritesController.addFavorite)

export default router;