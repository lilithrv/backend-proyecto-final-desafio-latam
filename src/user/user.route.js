import { Router } from "express";
import { userController } from "./user.controller.js";
import { verifyToken, verifyUser } from "../middlewares/verify.js";

const router = Router()

router.post("/register", userController.addUser);
router.post("/login", verifyUser ,userController.getLogin)
router.get("/user/profile", verifyToken, userController.getProfile)
router.put("/user/profile", verifyToken, userController.updateUser)

export default router;