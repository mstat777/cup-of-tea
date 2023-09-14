import express from "express";
import session from "express-session";

import cors from "cors";

import "dotenv/config";

import { setSession } from "./config/session.js";
import router from "./router/index.routes.js";

const PORT = process.env.PORT || process.env.LOCAL_PORT;

const app = express();

app.use(cors())
    .use(express.static("public"))
    .use(session({
        secret: process.env.SK,
        resave: false,
        saveUninitialized: false
    }))
    .use(setSession)
    .use(router);

app.listen(PORT, () => console.log(`running on http://localhost:${PORT}`));