import request from "supertest"
import {app} from "../index.js"

describe("Operaciones CRUD books", () => {
    test("Ruta POST/authors agrega un nuevo autor y devuelve código 201", async () => {
        const newAuthor = {
            name: "Marcela Paz"
        };
        const response = await request(app)
            .post("/api/v1/authors")
            .send(newAuthor);
        expect(response.status).toBe(201);
    })
})