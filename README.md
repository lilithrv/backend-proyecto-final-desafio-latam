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
- `GET: /api/v1/user/profile` :
- `PUT: /api/v1/user/profile/:id` :
- `GET: /api/v1/authors`: Returns 
- `POST: /api/v1/authors` :
- `GET: /api/v1/categories`:
- `POST: /api/v1/categories` :

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
ENDPOINT: localhost:3000/api/v1/user/profile/:id
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
To get the list of authors:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/authors
```

To add an author:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/authors
```


```JSON
BODY JSON

{
   "name": ""
}
```

To get the list of categories:

```
METHOD: GET
ENDPOINT: localhost:3000/api/v1/categories
```

To add a category:

```
METHOD: POST
ENDPOINT: localhost:3000/api/v1/categories
```


```JSON
BODY JSON

{
   "name": ""
}
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