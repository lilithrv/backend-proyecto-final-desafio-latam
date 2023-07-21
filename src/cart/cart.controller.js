import { handleErrors } from "../database/errors.js";
import { bookModel } from "../book/book.model.js";
import { userModel } from "../user/user.model.js";
import { cartModel } from "./cart.model.js";

const addCart = async (req, res) => {

    try {
        //cart_details: arreglo de objetos libros
        const { address_id, cart_details } = req.body
        let total = 0
        const user = await userModel.findUserByEmail({ email: req.email })
       
        const region = await cartModel.findRegion(address_id)
        const delivery_price = region.rows[0].delivery_price

        const cart = await cartModel.createCart(user.rows[0].id, address_id, delivery_price)

        total += Number(delivery_price)

        //await Promise.all, va a esperar la respuesta de todo lo que está adentro antes de seguir
        await Promise.all(cart_details.map(async item => {
            const book = await bookModel.findOne(item.book_id)
            const price = book.rows[0].price   //viene de db
            const quantity = item.quantity     //viene de cliente
            const sub_total = Number(price) * Number(quantity)
            total += sub_total
            if (quantity > book.rows[0].stock) {
                throw { code: "415" };
            }
            const cartdetail = await cartModel.createCartDetail(quantity, price, sub_total, cart.rows[0].id, item.book_id)
            const stock = Number(book.rows[0].stock) - Number(quantity)   //stock origina db menos lo que compra el usuario
            const resultingStock = await bookModel.updateStock(stock, item.book_id)
        }))

        const result = await cartModel.updateTotal(total, cart.rows[0].id)

        return res.status(201).json({ ok: true, result: result.rows[0] })

    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getCarts = async (req, res) => {
    try {
        const user = await userModel.findUserByEmail({ email: req.email })
        const result = await cartModel.findAll(user.rows[0].id)
        return res.json({ ok: true, result: result.rows })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

const getOneCart = async (req, res) => {

    const { cart_id } = req.params

    try {
        if (!cart_id.trim()) {
            throw { code: "409" };
        }
        const user = await userModel.findUserByEmail({ email: req.email })
        const result = await cartModel.findOne(cart_id, user.rows[0].id)
        if (result.rows.length == 0) {
            throw { code: "410" };
        }
        return res.json({ ok: true, result: result.rows })
    } catch (error) {
        const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
    }
}

export const cartController = {
    addCart,
    getCarts,
    getOneCart
}