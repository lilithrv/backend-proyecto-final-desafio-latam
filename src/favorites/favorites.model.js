import { pool } from "../database/connection.js"

const findFavorite = async () => {
    try {
        const text = "SELECT  FROM favorites"

    } catch (error) {
        console.log(error)
        throw error
    }
}


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

const checkFavorite = async (user_id, book_id) => {
    try {
      const text = "SELECT * FROM favorite_books WHERE user_id = $1 AND book_id = $2"
      const result = await pool.query(text, [user_id, book_id])
      return result.rows.length > 0 
    } catch (error) {
      console.log(error)
      throw error
    }
  }

const remove = async (user_id, book_id) => {
    try {
        const text = "DELETE FROM favorite_books WHERE user_id = $1 AND book_id = $2 RETURNING *"
        const result = await pool.query(text, [user_id, book_id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const favoritesModel = {
    insertFavorite,
    checkFavorite,
    remove,
}