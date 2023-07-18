import { pool } from "../database/connection.js"

const insertFavorite = async (user_id, book_id) => {
    try {
        const text = "INSERT INTO favorite_books (user_id, book_id) VALUES ($1, $2) RETURNING *"
        const result = await pool.query(text, [user_id, book_id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const favoritesModel = {
    insertFavorite
}