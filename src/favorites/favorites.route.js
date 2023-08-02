import { Router } from "express";
import { favoritesController} from "./favorites.controller.js";
import { verifyToken } from "../middlewares/verify.js";

const router = Router()

//user no requiere id en params, porque se obtiene id de req.email --> ver controller
router.get("/user/favorites", verifyToken, favoritesController.getFavorites);
router.post("/user/favorites", verifyToken, favoritesController.addFavorite);
router.delete("/user/favorites", verifyToken, favoritesController.deleteFavorite)

export default router;