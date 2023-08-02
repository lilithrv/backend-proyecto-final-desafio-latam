import { pool } from "../database/connection.js";

const createCart = async (user_id, address_id, delivery_price) => {
    try {
        //total, no se pasa altiro, para poder hacer el cálculo 
        const text = "INSERT INTO carts (user_id, address_id, delivery_price) VALUES ($1, $2, $3) RETURNING *"
        const result = await pool.query(text, [user_id, address_id, delivery_price])
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

const findRegion = async (address_id) => {
    try {
        const text = "SELECT delivery_price FROM regions WHERE id = $1"
        const result = await pool.query(text, [address_id])
        return result
    } catch (error) {

    }
}


const findDeliveryPriceByAddress = async (address_id) => {
    try {
        const text = "SELECT regions.delivery_price FROM addresses join communes on communes.id = addresses.commune_id join regions on regions.id = communes.region_id  WHERE addresses.id = $1"
        const result = await pool.query(text, [address_id])
        return result
    } catch (error) {

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

const findAll = async (user_id) => {
    try {
        const text = `
        SELECT
          carts.id,
          created_at,
          total,
          json_build_object(
            'id', addresses.id,
            'address', addresses.address,
            'commune',
            json_build_object(
              'id', communes.id,
              'name', communes.name,
              'region_id', communes.region_id
            ),
            'user_id', addresses.user_id
          ) AS address
        FROM
          carts
        JOIN
          addresses ON carts.address_id = addresses.id
        JOIN
          communes ON addresses.commune_id = communes.id
        WHERE
          carts.user_id = $1;
      `;
        const result = await pool.query(text, [user_id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}

const findOne = async (cart_id, user_id) => {
    try {
        const text = `
        SELECT cart_details.quantity, cart_details.price, cart_details.sub_total, carts.created_at, books.id as "books_id", books.title from cart_details 
        JOIN carts ON cart_details.cart_id = carts.id
        JOIN books ON cart_details.book_id = books.id
        WHERE cart_id = $1 AND carts.user_id = $2           
 `;
        const result = await pool.query(text, [cart_id, user_id])
        return result
    } catch (error) {
        console.log(error)
        throw error
    }
}


export const cartModel = {
    createCart,
    createCartDetail,
    findRegion,
    updateTotal,
    findAll,
    findOne,
    findDeliveryPriceByAddress
}