import { pool } from "../database/connection.js"

const findAuthors = async () => {
    try {
        const result = await pool.query("SELECT * FROM authors");
        return result.rows
    } catch (error) {
        throw error
    }
}

const findAnAuthor = async ({name}) => {                                       //para no agregar autor ya existente en db
    try {
        const text = "SELECT name FROM authors WHERE UPPER(name) = UPPER($1)"
        const { rows } = await pool.query(text, [name])
        return { rows }
    } catch (error) {
        console.log(error)
        throw error
    }
}

const findCategories = async () => {
    try {
        const result = await pool.query("SELECT * FROM categories");
        return result.rows
    } catch (error) {
        console.log(error)
        throw error
    }
}

const findACategory = async ({name}) => {                                       //para no agregar categoría ya existente en db
    try {
        const text = "SELECT name FROM categories WHERE UPPER(name) = UPPER($1)"
        console.log(text)
        const { rows } = await pool.query(text, [name])
        console.log(rows)
        return { rows }
    } catch (error) {
        console.log(error)
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

const createCategory = async (name) => {
    try {
        const text = "INSERT INTO categories (name) VALUES ($1) RETURNING name"
        const { rows } = await pool.query(text, [name])
        return { rows }
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const bookModel = {
    findAuthors,
    findAnAuthor,
    findCategories,
    findACategory,
    createAuthor,
    createCategory
}