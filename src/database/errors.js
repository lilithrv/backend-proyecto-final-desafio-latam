export const handleErrors = (code) => {
  if (!code) {
    return {
      status: 500,
      message: "Server error, unknown code",
    };
  }

  switch (code) {
    case "22P02":
      return {
        status: 400,
        message: "Invalid format in the parameter: Only numbers are accepted",
      };
    case "28P01":
      return {
        status: 400,
        message: "Incorrect postgres password",
      };
    case "3D000":
      return {
        status: 400,
        message: "Database does not exist",
      };
    case "ECONNREFUSED":
      return {
        status: 400,
        message: "Failed to connect to the database",
      };
    case "23503":
      return {
        status: 404,
        message: "Object does not exist"
      };
    case "401":
      return {
        status: 404,
        message: "You must complete all fields: name, lastname, email, birthday, password",
      };
    case "402":
      return {
        status: 401,
        message: "Unauthorized: Bearer format token required"
      };
    case "403":
      return {
        status: 403,
        message: "You must complete all fields: email, password"
      };
    case "404":
      return {
        status: 404,
        message: "User does not exist"
      };
    case "405":
      return {
        status: 404,
        message: "Incorrect password"
      };
    case "406":
      return {
        status: 404,
        message: "You must enter the author's name"
      };
    case "407":
      return {
        status: 404,
        message: "The registry already exists"
      };
    case "408":
      return {
        status: 404,
        message: "You do not have access to this route"
      };
    case "409":
      return {
        status: 404,
        message: "You must specify the id"
      };
    case "410":
      return {
        status: 404,
        message: "File not found"
      };
    case "411":
      return {
        status: 404,
        message: "You must complete all fields: title, image, description, price, stock, category_id, author_id"
      };
    case "412":
      return {
        status: 404,
        message: "Price and stock must be greater than 0"
      };
    case "413":
      return {
        status: 404,
        message: "You must specify the book_id"
      };
    case "414":
      return {
        status: 404,
        message: "The book is already added to your favorites"
      };
    case "415":
      return {
        status: 404,
        message: "Book without enought stock"
      };
      case "416":
        return {
          status: 401,
          message: "Expired token"
        };
    default:
      return {
        status: 500,
        message: "Internal Server Error"
      };
  }
};