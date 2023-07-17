import { Router } from "express";
import { userController } from "./user.controller.js";
import { verifyUser } from "../middlewares/verify.js";

const router = Router()

router.post("/register", userController.addUser);
router.post("/login", verifyUser ,userController.getLogin)

export default router;