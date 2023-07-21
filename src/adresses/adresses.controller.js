import { handleErrors } from "../database/errors.js";
import { addressesModel } from "./adresses.model.js";

const getAddress = async (req, res) => {
  try {
    const { user_id } = req.params;
    const result = await addressesModel.allAddresses(user_id);
    console.log(result);
    return res.status(200).json({ ok: true, result });
  } catch (error) {
    const { status, message } = handleErrors(error.code)
    console.log(error, message)
    return res.status(status).json({ ok: false, result: message });
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
    return res.status(201).json({ ok: true, result });
  } catch (error) {
    const { status, message } = handleErrors(error.code)
        console.log(error, message)
        return res.status(status).json({ ok: false, result: message });
  }
};

export const addressController = {
  getAddress,
  newAddress,
};
