import { Router } from "express";
import { addressController } from "./adresses.controller.js";

const router = Router();

router.get("/user/:user_id/addresses", addressController.getAddress);
router.put("/user/:user_id/addresses", addressController.modifyAddress);
router.post("/addresses", addressController.newAddress);

export default router;
