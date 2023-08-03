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

const findUserByEmail = async ({ email }) => {                                        //para no registrar usuario ya existente en db
    try {
        const text = "SELECT * FROM users WHERE UPPER(email) = UPPER($1)"
        const result = await pool.query(text, [email])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}


const update = async (id, name, lastname, username, password) => {
    //En el front no se va a mostrar la contraseña; al actualizar el perfil ese campo estará en blanco
    //Si se completa, se actualiza la contraseña, si no, los otros datos
    try {
        let values = [name, lastname, username]
        let text = "UPDATE users SET name = $1, lastname = $2, username =$3";
        if(password.trim() == ""){
           text += " WHERE id = $4"
           values.push(id)
        } else {
            text += ", password = $4 WHERE id = $5"
            values.push(password, id)
        } 
        text += " RETURNING name, lastname, username, email, birthday, is_admin"
        const result = await pool.query(text, values)
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const userModel = {
    createUser,
    findUserByEmail,
    update
}