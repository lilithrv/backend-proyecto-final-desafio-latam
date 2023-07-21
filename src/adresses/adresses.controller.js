import { addressesModel } from "./adresses.model.js";

const getAddress = async (req, res) => {
  try {
    const result = await addressesModel.allAddresses();
    console.log(result);
    return res.json({ ok: true, result });
  } catch (error) {
    console.log(error);
  }
};

export const addressController = {
  getAddress,
};
