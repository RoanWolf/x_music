import express from "express";
import cors from "cors";

import router from "./routers/userRoutes.ts";

const app = express();

app.use(cors());
app.use(express.json());

app.use("/v1/api",router);

export default app;
