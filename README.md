# Desafio Latam - Final Project: Backend Development

Members:
- Rodrigo González
- Matias Cuadros
- Leslie Reyes

## Description


## Routes
The server provides the following routes:

- `POST: /api/v1/register `: Allows registration of new users
- `POST: /api/v1/login` : Receives a user's credentials and returns a token generated with JWT. The email address of the registered user is included in the token payload
- `GET: /api/v1/user/profile` : Allows to view user profile data
- `PUT: /api/v1/user/profile` : Allows to update a user's profile information 
- `GET: /api/v1/user/favorites`: Allows to view the user's favorite books
- `POST: /api/v1/user/favorites` : Allows to add favorite books per user
- `DELETE: /api/v1/user/favorites` : Allows to delete of favorite books per user
- `GET: /api/v1/books`: Returns books data and allows sorting, limiting and pagination of information. Also filter by category and author
- `GET: /api/v1/books/:id`: Returns a specific book from the database
- `GET: /api/v1/books/latest`: Returns the last 10 books added, it's for a carousel of books
- `GET: /api/v1/books/popular`: Returns the 10 most buyed books, it's for a carousel of books
- `POST: /api/v1/books`: Allows you to add a new book
- `GET: /api/v1/authors`: Returns list of all authors belonging to the model books
- `POST: /api/v1/authors` : Allows you to add a new author
- `GET: /api/v1/categories`: Returns list of all categories belonging to the model books
- `POST: /api/v1/categories` : Allows you to add a new category
- `POST: /api/v1/user/purchase` : Allows to add the purchase and its detail to the database
- `GET: /api/v1/user/carts` : Allows to view the user's purchase history
- `GET: /api/v1/user/carts/:cart_id` : Allows you to view the details of a purchase

<br>


Environment variables
-------
Connects node.js to the PostgreSQL server. To specify which database to connect to, create an `.env` file with the following structure, also available in the `.env.example` file.

To create the database follow the instruction of the `queryCreate.sql ` file.

```
.env

PGUSER=postgres 
PGHOST=localhost
PGPASSWORD=
PGDATABASE=bookstore
PGPORT=5432
JWTPASSWORD=
```

<br>


Using [Thunder Client for VS Code](https://www.thunderclient.com/) or [Postman](https://www.postman.com/) as a client application
-------
<br>

To register:
```html
METHOD: POST 
ENDPOINT: localhost:3000/api/v1/register
```
```JSON
BODY JSON

{
  "name": "",
  "lastname": "",
  "email": "",
  "username": "",
  "birthday": "",
  "password": ""
}
```

<br>

To login:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/login
```

```JSON
BODY JSON

{
  "email": "",
  "password": ""
}
```
<br>

To get user profile:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/user/profile
AUTHORIZATION: Type Bearer Token
```
<br>

To update a profile:

```
METHOD: UPDATE
ENDPOINT: localhost:3000/api/v1/user/profile
AUTHORIZATION: Type Bearer Token
```

```JSON
BODY JSON

{
   "name": "",
   "lastname": "",
   "username": "",
   "password": ""
}
```
<br>


To view the user's favorite books:

```
METHOD: GET
ENDPOINT:localhost:3000/api/v1/user/favorites
AUTHORIZATION: Type Bearer Token
```
<br>

To add book to favorites:

```
METHOD: POST
ENDPOINT:localhost:3000/api/v1/user/favorites
AUTHORIZATION: Type Bearer Token
```


```JSON
BODY JSON

{
   "book_id":  
}
```
<br>

To remove a book from favorites:

```
METHOD: DELETE
ENDPOINT:localhost:3000/api/v1/user/favorites
AUTHORIZATION: Type Bearer Token
```

```JSON
BODY JSON

{
   "book_id":  
}
```
<br>

To get all books:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/books
```

To sort (asc/desc), limit and pagination:

- sort[title]
- sort[authors.name]
- sort[price]
- limit
- page

To filter by:
- category_id
- author_id

Examples:

```
localhost:3000/api/v1/books/?sort[title]=desc
```

```
localhost:3000/api/v1/books/?sort[authors.name]=desc
```

```
localhost:3000/api/v1/books/?limit=12&page=5
```

```
localhost:3000/api/v1/books/?author_id=7
```
```
localhost:3000/api/v1/books/?category_id=1&limit=5
```

<br>

To get a specific book:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/books/:id
```

<br>

To get the last 10 books added:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/books/latest
```
<br>


To get the top 10 most purchased books:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/books/popular
```
<br>

To add a new book:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/books/
AUTHORIZATION: Type Bearer Token 
ROL: admin
```

```JSON
BODY JSON

{
   "title": "",
   "image": "",
   "description": "",
   "price":  ,
   "stock": ,
   "category_id": ,
   "author_id": 
}
```

Example:

```JSON

{
   "title": "El Aleph",
   "image": "https://www.antartica.cl/media/catalog/product/9/7/9789875666481_1.png?quality=80&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700&format=jpeg",
   "description": "",
   "price": 10990,
   "stock": 25,
   "category_id": 10,
   "author_id": 32
}

```
<br>

To get the list of authors:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/authors
```
<br>

To add an author:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/authors
AUTHORIZATION: Type Bearer Token 
ROL: admin
```


```JSON
BODY JSON

{
   "name": ""
}
```
<br>

To get the list of categories:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/categories
```
<br>

To add a category:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/categories
AUTHORIZATION: Type Bearer Token
ROL: admin
```


```JSON
BODY JSON

{
   "name": ""
}
```
<br>

To add a purchase and it's detail:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/user/purchase
AUTHORIZATION: Type Bearer Token
```


```JSON
BODY JSON

{
   "address_id":  ,
   "cart_details": [ {"quantity": , "book_id": }, {"quantity": , "book_id": }]
}
```
<br>

To view purchase history:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/user/carts
AUTHORIZATION: Type Bearer Token
```

<br>

To view the details of a purchase:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/user/carts/:cart_id
AUTHORIZATION: Type Bearer Token
```

<br>

Database
-------
- [PostgreSQL](https://www.postgresql.org/)


Backend
-------

- [Node.js](https://nodejs.dev/)



## Dependencies

- Framework [Express](https://expressjs.com/es/)
- [CORS](https://expressjs.com/en/resources/middleware/cors.html) : For providing a Connect/Express middleware that can be used to enable CORS with various options 
- [node-postgres: pg](https://node-postgres.com/) : Collection of node.js modules to interact with PostgreSQL database 
- To safely create dynamic SQL queries: [pg-format](https://www.npmjs.com/package/pg-format)
- Environment variables [dotenv](https://www.npmjs.com/package/dotenv)
- [JSON Web Token (JWT)](https://jwt.io/) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object
- [bcrypt.js](https://www.npmjs.com/package/bcryptjs): To hash and salt passwords securely
- To install dependencies run: `npm install`
- devDependencies [Nodemon](https://www.npmjs.com/package/nodemon) for run server and automatically restarting the node application when file changes, in the terminal run: `npm run dev`