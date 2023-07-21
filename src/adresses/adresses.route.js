import { Router } from "express";
import { addressController } from "./adresses.controller.js";

const router = Router();

router.get("/addresses", addressController.getAddress);

export default router;
