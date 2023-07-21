import { pool } from "../database/connection.js";

// Query para seleccionar direcciones
// SELECT * FROM addresses WHERE user_id=$1

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
      "INSERT INTO addresses (address, commune_id, user_id) VALUES ($1, $2, $3)";
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

//Query para crear direccion nueva de usuario

export const addressesModel = {
  allAddresses,
  addAddress,
};
