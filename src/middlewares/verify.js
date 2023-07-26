import * as dotenv from "dotenv";
dotenv.config();

import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { handleErrors } from "../database/errors.js";
import { userModel } from "../user/user.model.js";

export const verifyToken = (req, res, next) => {
    try {
        const bearerHeaders = req.headers.authorization
        if (!bearerHeaders) {
            throw { code: "402" }
        }
        const token = bearerHeaders.split(" ")[1]

        jwt.verify(token, process.env.JWTPASSWORD)
        const payload = jwt.decode(token);
        req.email = payload.email;

        next()
    } catch (error) {
        if (error instanceof jwt.TokenExpiredError) {
            const { status, message } = handleErrors("416")
            return res.status(status).json({ ok: false, result: message });
        } else {
            const { status, message } = handleErrors(error.code)
            return res.status(status).json({ ok: false, result: message });
        }
    }
}

export const verifyUser = async (req, res, next) => {
    const { email, password } = req.body
    try {
        if (!email || !password) {
            throw { code: "403" };
        }

        const { rows: [userDB], rowCount } = await userModel.findUserByEmail({ email });
        if (!rowCount) {
            throw { code: "404" };
        }

        const validatePassword = await bcrypt.compare(password, userDB.password);
        if (validatePassword == false) {
            throw { code: "405" };
        }

        console.log("Usuario autenticado con éxito: ", userDB.email)
        next()
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

export const verifyAdmin = async (req, res, next) => {
    try {
        const { rows: [userDB] } = await userModel.findUserByEmail({ email: req.email });
        if (!userDB.is_admin) {
            throw { code: "408" };
        }
        next()
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

