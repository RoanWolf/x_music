import { CreateUserRequest, LoginUserRequest } from "./type/authType.ts";
import type { Response } from "express";
import express from "express";
import cors from "cors";
const app = express();
app.use(cors());
app.use(express.json());

app.post("/signup", (req: CreateUserRequest, res: Response) => {
  const { name, email, password } = req.body;
  return res.json({ name, email, password });
});

app.post("/login", (req: LoginUserRequest, res: Response) => {
  const { email, password } = req.body;
  return res.json({ email, password });
});

app.listen(3000, () => {
  console.log("ok");
});
