import { handleErrors } from "../database/errors.js";
import { userModel } from "../user/user.model.js";
import { favoritesModel } from "./favorites.model.js";

const addFavorite = async (req, res) => {

    const { book_id } = req.body
    //validación de existencia del libro: código psql en errors.js
    try {
        if (!book_id) {
            throw { code: "413" };
        }
        const user = await userModel.findUserByEmail({ email: req.email })
        const isFavorite = await favoritesModel.checkFavorite(user.rows[0].id, book_id);

        if (isFavorite) {
            throw { code: "414" };
        }

        const result = await favoritesModel.insertFavorite(user.rows[0].id, book_id)
        return res.json({ ok: true,  message: "Book added as favorite", result: result.rows[0] })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const deleteFavorite = async (req, res) => {

    const { book_id } = req.body

    try {
        if (!book_id) {
            throw { code: "413" };
        }
        const user = await userModel.findUserByEmail({ email: req.email })
        const result = await favoritesModel.remove(user.rows[0].id, book_id)
        if (result.rows.length === 0) {
            throw { code: "410" };
        }
        return res.json({ ok: true, message: "Book removed from favorites", result: result.rows[0] })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

export const favoritesController = {
    addFavorite,
    deleteFavorite
}