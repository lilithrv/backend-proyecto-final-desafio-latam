import { handleErrors } from "../database/errors.js";
import { bookModel } from "./book.model.js";

const getAuthor = async (req, res) => {
    try {
        const result = await bookModel.findAuthors()
        return res.json({ ok: true, result });
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getCategory = async (req, res) => {
    try {
        const result = await bookModel.findCategories()
        return res.json({ ok: true, result });
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        return res.status(status).json({ ok: false, result: message });
    }
}

const addAuthor = async (req, res) => {
    const { name } = req.body

    try {
        const existingAuthor = await bookModel.findAnAuthor({ name })

        if (existingAuthor.rows.length > 0) {
            throw { code: "407" };
        }

        if (!name) {
            throw { code: "406" };
        }
        const result = await bookModel.createAuthor(name)
        return res.status(201).json({ ok: true, result: result.rows[0] });
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const addCategory = async (req, res) => {
    const { name } = req.body

    try {
        const existingCategory = await bookModel.findACategory({ name })
        console.log(existingCategory)

        if (existingCategory.rows.length > 0) {
            return res.status(400).json({ mensaje: "La categoría ya existe, seleccionala de la lista" });
        } else if (!name) {
            throw { code: "406" };
        }

        const result = await bookModel.createCategory(name)
        return res.status(201).json({ ok: true, result: result.rows[0] });

    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}


export const bookController = {
    getAuthor,
    getCategory,
    addAuthor,
    addCategory
}