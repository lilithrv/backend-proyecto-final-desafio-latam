import { pool } from "../database/connection.js"

const findFavorite = async (user_id) => {
    //json_build_objetc: permite que resultado sea entregado como un objeto para visualizar propiedades
    try {
        const text =
        "SELECT b.title,(SELECT json_build_object('id', a.id, 'name', a.name) FROM authors a WHERE a.id = b.author_id) AS author, (SELECT json_build_object('id', c.id, 'name', c.name) FROM categories c WHERE c.id = b.category_id) AS category FROM favorite_books fb JOIN books b ON fb.book_id = b.id WHERE fb.user_id = $1;"
        const result = await pool.query(text, [user_id])
        return result
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
    findFavorite,
    insertFavorite,
    checkFavorite,
    remove,
}