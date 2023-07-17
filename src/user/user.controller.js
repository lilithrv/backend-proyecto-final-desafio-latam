import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { handleErrors } from "../database/errors.js";
import { userModel } from "./user.model.js";

const addUser = async (req, res) => {
    const { name, lastname, email, username, birthday, password } = req.body
    try {
        const existingUser = await userModel.findUserByEmail({ email })
        console.log(existingUser)

        if (existingUser.rows.length > 0) {
            throw { code: "407" };
        }

        if (!name || !lastname || !email || !username || !birthday || !password) {
            throw { code: "401" };
        }

        const hashPassword = await bcrypt.hash(password, 10)
        const result = await userModel.createUser(name, lastname, email, username, birthday, hashPassword)
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

const getProfile = async (req, res) => {
    try {
        const result = await userModel.findUserByEmail({ email: req.email })
        return res.status(200).json({ ok: true, result: result.rows[0]})
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const updateUser = async (req, res) => {

    const { name, lastname, username, password } = req.body

    try {
        const user = await userModel.findUserByEmail({ email: req.email })
        let hashPassword = ""
        if (password.trim() !== "") {
            hashPassword = await bcrypt.hash(password, 10)
        }
        const result = await userModel.update(user.rows[0].id, name, lastname, username, hashPassword)
        return res.status(200).json({ ok: true, result: result.rows[0] })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}


export const userController = {
    addUser,
    getLogin,
    getProfile,
    updateUser
}