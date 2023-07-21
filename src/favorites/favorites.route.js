import { Router } from "express";
import { favoritesController} from "./favorites.controller.js";
import { verifyToken } from "../middlewares/verify.js";

const router = Router()

router.get("/user/favorites", verifyToken, favoritesController.getFavorites);
router.post("/user/favorites", verifyToken, favoritesController.addFavorite);
router.delete("/user/favorites", verifyToken, favoritesController.deleteFavorite)

export default router;