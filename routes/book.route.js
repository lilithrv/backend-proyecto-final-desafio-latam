import { Router } from "express";
import { bookController } from "../controllers/book.controller.js";

const router = Router();

router.get("/", (req, res) => {
    res.json({ ok: true, result: "All ok in the root path" });
});
router.get("/authors", bookController.getAuthor);
router.get("/categories", bookController.getCategory);
router.post("/authors", bookController.addAuthor);

export default router;