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
  }
};

//Query para crear direccion nueva de usuario

export const addressesModel = {
  allAddresses,
};
