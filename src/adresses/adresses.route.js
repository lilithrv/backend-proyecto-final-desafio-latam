import { Router } from "express";
import { addressController } from "./adresses.controller.js";

const router = Router();

router.get("/user/:user_id/addresses", addressController.getAddress);
router.get("/addresses", addressController.getAllRegionsCommunes);
router.put("/user/:user_id/addresses", addressController.modifyAddress);
router.post("/user/:user_id/addresses", addressController.newAddress);
router.delete("/user/addresses/:id", addressController.deleteAddress);

export default router;
