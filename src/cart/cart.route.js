import { Router } from "express";
import { cartController } from "./cart.controller.js";
import { verifyToken } from "../middlewares/verify.js";

const router = Router()

//ruta de carro actual, sin finalizar: localstorage, para evitar que se pierda al refrescar la página
//ruta: /cardetail, porque al finalizar compra, se irá directo al histórico de compras

//Rutas a agregar:
//- Simular proceso de compra: modelos insertar compra e insertar detalle
//- Ver histórico de compras: get de db carts
//- Ver detalle de una compra: get db cart_details

router.post("/user/purchase", verifyToken, cartController.addCart)
router.get("/user/carts", verifyToken, cartController.getCarts)

export default router;