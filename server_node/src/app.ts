import express from "express";
import cors from "cors";

import router from "./routers/userRoutes.ts";
import { authMiddleware } from "./middlewares/authMiddleware.ts";

const app = express();

app.use(cors());
app.use(express.json());

app.use("/v1/api",router);
app.use(authMiddleware);


export default app;
