import { Router } from "express";
import { addressController } from "./adresses.controller.js";

const router = Router();

router.get("/user/:user_id/addresses", addressController.getAddress);
router.post("/addresses", addressController.newAddress);

export default router;
