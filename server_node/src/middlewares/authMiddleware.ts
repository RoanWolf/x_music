import type { Request, Response, NextFunction } from "express";
import { authService } from "../utils/jwtHelper.ts";
export const authMiddleware = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) {
    return res.status(401).json({ error: "No authorization header" });
  }

  const [authType, token] = authHeader.split(" ");
  if (authType !== "Bearer") {
    return res.status(401).json({ error: "Invalid authorization type" });
  }

  try {
    const userId = await authService.verifyToken(token);
    req.userId = userId.id;
    next();
  } catch (err: any) {
    return res.status(401).json({ error: "Invalid token" });
  }
};
