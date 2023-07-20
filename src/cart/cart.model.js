import { pool } from "../database/connection.js";

const createCart = async (user_id, address_id) => {
    try {
        //total, no se pasa altiro, para poder hacer el cálculo 
        const text = "INSERT INTO carts (user_id, address_id) VALUES ($1, $2) RETURNING *"
        const result = await pool.query(text, [user_id, address_id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

const createCartDetail = async (quantity, price, sub_total, cart_id, book_id) => {
    try {
        const text = "INSERT INTO cart_details (quantity, price, sub_total, cart_id, book_id) VALUES ($1, $2, $3, $4, $5) RETURNING *"
        const result = await pool.query(text, [quantity, price, sub_total, cart_id, book_id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

const updateTotal = async (total, id) => {
    try {
        //total se suma al carro después de haberlo calculado
        const text = "UPDATE carts SET total = $1 WHERE id = $2 RETURNING *"
        const result = await pool.query(text, [total, id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

export const cartModel = {
    createCart,
    createCartDetail,
    updateTotal
}