import { Router } from "express";

import { home } from "../controller/app.js";

import Query from "../model/Query.js";

const router = Router();

// ROUTES APP
router.get("/", home);

router.get("/api/v1/tea/all", async function(req, res) {
    const query = "SELECT label_1, url_tea, url_image FROM tea WHERE id = 2";
    const [datas] = await Query.find(query);
    //console.log([datas]);
    res.json( [datas] );
});







// ROUTES de BACK OFFICE

export default router;