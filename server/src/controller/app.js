import Query from "../model/Query.js";

import bcrypt from "bcrypt";

const SALT_ROUND = 10;

// ------------------------------------------ //
//        page de vue de l'application        //
// ------------------------------------------ //
// la page Home
async function home(req, res) {
    const query = "SELECT label_1, url_tea, url_image FROM tea";
    const [datas] = await Query.find(query);
    //console.log([datas]);
    res.json([datas]);
}

export { home };