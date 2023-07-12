import { pool } from "../database/connection.js"

const findAuthors = async () => {
    try {
        const result = await pool.query("SELECT * FROM authors");
        return result.rows
    } catch (error) {
        throw error
    }
}

const findCategories = async () => {
    try {
        const result = await pool.query("SELECT * FROM categories");
        return result.rows
    } catch (error) {
        throw error
    }
}

const createAuthor = async (name) => {
    try {
        const text = "INSERT INTO authors (name) VALUES ($1) RETURNING name"
        const { rows } = await pool.query(text, [name])
        return { rows }
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const bookModel = {
    findAuthors,
    findCategories,
    createAuthor
}