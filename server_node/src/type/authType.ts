import type { Request, Response } from "express";

interface CreateUserBody {
  name: string;
  email: string;
  password: string;
}

interface LoginUserBody {
  email: string;
  password: string;
}

export interface CreateUserRequest extends Request<{}, {}, CreateUserBody> {}
export interface LoginUserRequest extends Request<{}, {}, LoginUserBody> {}
