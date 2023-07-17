import { pool } from "../database/connection.js"

const createUser = async (name, lastname, email, username, birthday, password) => {
    try {
        const text = "INSERT INTO users (name, lastname, email, username, birthday, password) VALUES ($1, $2, $3, $4, $5, $6) RETURNING name, lastname, username, email, birthday"
        const { rows } = await pool.query(text, [name, lastname, email, username, birthday, password])
        return { rows }
    } catch (error) {
        console.log(error)
        throw error
    }
}

const findUserByEmail = async ({email}) => {                                        //para no registra usuario ya existente en db
    try {
        const text = "SELECT * FROM users WHERE UPPER(email) = UPPER($1)"
        const  result  = await pool.query(text, [email])
        return result 
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const userModel = {
    createUser,
    findUserByEmail,
}