import request from "supertest"
import { app } from "../src/index.js"

describe("Bookstore: CRUD operations", () => {
    test("Path: GET/books returns code 200", async () => {
        const response = await request(app)
            .get("/api/v1/books")

        expect(response.status).toBe(200);
    });

    test("Set 404 code when trying to remove from favorites book that was never added to that table", async () => {
        const jwt = "token";
        const favorite = {
            "book_id": 7
        }

        const response = await request(app)
            .delete("/api/v1/favorites")
            .set("Authorization", jwt)
            .send(favorite)

        expect(response.status).toBe(404);
    });

    test("Get code 400 when logging in with incorrect credentials", async () => {
        const user = {
            "email": "jorge@gmail.com",
            "password": "123123"
        }

        const response = await request(app)
            .post("/api/v1/login")
            .send(user)

        expect(response.status).toBe(404);
    });

    test("Get 401 code when trying to log in to profile without authentication", async () => {

        const response = await request(app)
            .get("/api/v1/user/profile")

        expect(response.status).toBe(401);
    });
})