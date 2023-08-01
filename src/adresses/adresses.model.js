import { pool } from "../database/connection.js";


//Direcciones para consumir en el formulario
const findAllAddresses = async () => {
  try {
    const query = `
    SELECT 
    regions.id AS region_id,
    regions.name AS region_name,
    regions.delivery_price,
    json_agg(json_build_object('id', communes.id, 'name', communes.name)) AS communes
    FROM 
    regions
    INNER JOIN 
    communes ON regions.id = communes.region_id
    GROUP BY
    regions.id,
    regions.name,
    regions.delivery_price
    ORDER BY regions.id ASC`;

    const { rows } = await pool.query(query);
    return rows;
  } catch (error) {
    console.error("Error al obtener las locaciones:", error);
    throw error;
  }
};


const allAddresses = async (user_id) => {
  try {
    const query = `
      SELECT  ad.id, com.name AS commune_name, reg.name AS region_name, ad.address, reg.delivery_price
      FROM addresses AS ad
      JOIN communes AS com ON ad.commune_id = com.id
      JOIN regions AS reg ON reg.id = com.region_id
      WHERE ad.user_id = $1`;
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

const removeAddress = async (id) => {
  const query = "DELETE FROM addresses WHERE id = $1 RETURNING *";
  const { rows } = await pool.query(query, [id]);
  if (rows.length === 0) {
    throw { code: 404 };
  }
  return rows[0];
}

const countPurchases = async (address_id) => {
  try {
    const query = "SELECT * FROM carts WHERE address_id = $1"
    const { rows } = await pool.query(query, [address_id])
    return rows
  } catch (error) {
    console.log(error);
    throw error;
  }
}

export const addressesModel = {
  findAllAddresses,
  allAddresses,
  addAddress,
  updateAddress,
  removeAddress,
  countPurchases
};
