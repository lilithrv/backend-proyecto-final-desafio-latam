import { handleErrors } from "../database/errors.js";
import { bookModel } from "../models/book.model.js"

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
    const {name } = req.body
    try {
        const result = await bookModel.createAuthor(name)
        return res.status(201).json({ ok: true, result });
    } catch (error) {
      console.log(error)
    }
}

export const bookController = {
    getAuthor,
    getCategory,
    addAuthor,
}