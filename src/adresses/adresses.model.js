import { pool } from "../database/connection.js";

const allAddresses = async (user_id) => {
  try {
    const query = "SELECT * FROM addresses WHERE user_id=$1";
    const { rows } = await pool.query(query, [user_id]);
    return rows;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

const addAddress = async (address, commune_id, user_id) => {
  try {
    const query =
      "INSERT INTO addresses (address, commune_id, user_id) VALUES ($1, $2, $3) RETURNING *";
    const values = [address, commune_id, user_id];
    const { rows } = await pool.query(query, values);
    if (!rows[0]) {
      throw new Error("Error al agregar la dirección");
    } else {
      return rows;
    }
  } catch (error) {
    console.log(error);
    throw error;
  }
};

const updateAddress = async (address, commune_id, user_id) => {
  try {
    const query =
      "UPDATE addresses SET address = $1, commune_id = $2, user_id = $3  WHERE id = $4 RETURNING *";
    const id = 12;
    const values = [address, commune_id, user_id, id];
    const { rows } = await pool.query(query, values);
    return rows;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const addressesModel = {
  allAddresses,
  addAddress,
  updateAddress,
};
