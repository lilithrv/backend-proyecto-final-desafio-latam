import { handleErrors } from "../database/errors.js";
import { bookModel } from "../models/book.model.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";

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

const addUser = async (req, res) => {
    const { name, lastname, email, username, birthday, password } = req.body
    try {
        const existingUser = await bookModel.findUserByEmail({email})
        console.log(existingUser)

        if (existingUser.rows.length > 0) {
            throw { code: "407" };
        }

        if (!name || !lastname || !email || !username || !birthday || !password) {
            throw { code: "401" };
        }

        const hashPassword = await bcrypt.hash(password, 10)
        const result = await bookModel.createUser(name, lastname, email, username, birthday, hashPassword)
        console.log("Usuario registrado con éxito: ", result.rows[0])
        return res.json({ ok: true, result: result.rows[0] })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getLogin = async (req, res) => {
    const { email } = req.body
    try {
        //validación parámetros en middleware
        const token = jwt.sign({ email }, process.env.JWTPASSWORD, {
            expiresIn: "1h",
        })
        console.log("Token: ", token)
        res.json(token)
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
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
    addUser,
    getLogin,
    addAuthor,
    addCategory
}