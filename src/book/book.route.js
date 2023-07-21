import { Router } from "express";
import { bookController } from "./book.controller.js";
import { verifyAdmin, verifyToken} from "../middlewares/verify.js";

const router = Router();

router.get("/", (req, res) => {
    res.json({ ok: true, result: "All ok in the root path" });
});
router.get("/authors", bookController.getAuthor);
router.get("/categories", bookController.getCategory);
router.post("/authors", verifyToken, verifyAdmin, bookController.addAuthor);
router.post("/categories", verifyToken, verifyAdmin, bookController.addCategory)
router.get("/books", bookController.getAllBooks);
router.get("/books/latest", bookController.getLatest);  //para carrusel de landing page
router.get("/books/popular", bookController.getPopular);  //para carrusel de landing page
router.get("/books/:id", bookController.getOneBook);
router.post("/books",verifyToken, verifyAdmin, bookController.addBook);

export default router;