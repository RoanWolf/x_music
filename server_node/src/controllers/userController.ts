import type { Request, Response } from "express";
import validator from "validator";

import { CreateUserRequest, LoginUserRequest } from "../type/authType.ts";
import { userService } from "../services/userService.ts";

import { hashPassword } from "../utils/pwHelper.ts";
import { authService } from "../utils/jwtHelper.ts";

export const userController = {
  async createUser(req: CreateUserRequest, res: Response) {
    const { name, email, password } = req.body;

    try {
      if (!validator.isEmail(email)) {
        return res.status(400).json({ msg: "Invalid email" });
      }

      const haveUser = await userService.queryUserByEmail(email);

      if (haveUser) {
        return res.status(400).json({ msg: "User already exists" });
      }

      const passwordHash: string = await hashPassword(password);
      
      const user = await userService.createUser({
        name,
        email,
        password: passwordHash,
      });
      const token = await authService.generateToken(user.id);
      res.status(200).json({
        msg: "Signup successful",
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
          token: token,
        },
      });

    } catch (err: any) {
      res.status(400).json({ msg: "error occurred! Please try again later." });
    }
  },
  async loginUser(req: LoginUserRequest, res: Response) {
    const { email, password } = req.body;

    try {
      const user = await userService.validatePassword(email, password);

      if (!user) {
        return res.status(400).json({ msg: "Invalid email or password" });
      }

      const token = await authService.generateToken(user.id);
      return res.status(200).json({
        msg: "Login successful",
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
          token: token,
        },
      });
    } catch (err: any) {
      res.status(400).json({ msg: "error occurred! Please try again later." });
    }
  },
};
