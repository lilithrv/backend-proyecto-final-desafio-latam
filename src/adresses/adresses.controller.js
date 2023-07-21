import { addressesModel } from "./adresses.model.js";

const getAddress = async (req, res) => {
  try {
    const {user_id}=req.params;
    const result = await addressesModel.allAddresses(user_id);
    console.log(result);
    return res.json({ ok: true, result });
  } catch (error) {
    console.log(error);
  }
};

const newAddress = async (req, res) => {
  try {
    const { address, commune_id, user_id } = req.body;
    const result = await addressesModel.addAddress(
      address,
      commune_id,
      user_id
    );
    console.log(result);
    return res.json({ ok: true, result });
  } catch (error) {
    console.log(error);
  }
};

export const addressController = {
  getAddress,
  newAddress,
};
