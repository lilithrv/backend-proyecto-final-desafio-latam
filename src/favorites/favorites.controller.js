import { handleErrors } from "../database/errors.js";
import { userModel } from "../user/user.model.js";
import { favoritesModel } from "./favorites.model.js";

const addFavorite = async (req, res) => {

    const { book_id } = req.body
    //validación de existencia del libro: código psql en errors.js
    try {
        if(!book_id){
            throw { code: "413" };
        }
        const user = await userModel.findUserByEmail({ email: req.email })
        const result = await favoritesModel.insertFavorite(user.rows[0].id, book_id)
        return res.json({ok: true, result: result.rows[0]})
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

export const favoritesController = {
    addFavorite
}