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

const getAllBooks = async (req, res) => {
    const { sort, limit, page, category_id, author_id } = req.query;
    try {
        const result = await bookModel.findAll(sort, limit, page, category_id, author_id)
        return res.json({ ok: true, result });
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getOneBook = async (req, res) => {

    const { id } = req.params

    try {
        if (!id.trim()) {
            throw { code: "409" };
        }
        const result = await bookModel.findOne(id)
        if (result.rows.length === 0) {
            throw { code: "410" };
        }
        return res.json({ ok: true, result: result.rows[0] })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const addBook = async (req, res) => {

    const { title, image, description, price, stock, category_id, author_id } = req.body

    try {
        if (price <= 0 || stock <= 0) {
            throw { code: "412" };
        }

        if (!title || !image || !description || !price || !stock || !category_id || !author_id) {
            throw { code: "411" };
        }

        const result = await bookModel.createBook(title, image, description, price, stock, category_id, author_id)
        return res.json({ ok: true, result: result.rows[0] })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getLatest = async (req, res) => {
    try {
        const result = await bookModel.latest()
        return res.json({ ok: true, result: result.rows })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getPopular = async (req, res) => {
    try {
        const result = await bookModel.popular()
        return res.json({ok: true, result: result.rows})
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
    addCategory,
    getAllBooks,
    getOneBook,
    addBook,
    getLatest,
    getPopular
}