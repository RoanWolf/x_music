import { SignJWT, jwtVerify } from "jose";

const JWT_SECRET = new TextEncoder().encode(process.env.JWT_SECRET);

export const authService = {
  async generateToken(userId: number): Promise<string> {
    try {
      const token = await new SignJWT({ id: userId })
        .setProtectedHeader({ alg: "HS256" }) 
        .setExpirationTime("1h") 
        .sign(JWT_SECRET);
      return token;
    } catch (error: any) {
      throw new Error(`Failed to generate token: ${error.message}`);
    }
  },

  async verifyToken(token: string): Promise<{ id: number }> {
    try {
      const { payload } = await jwtVerify(token, JWT_SECRET, {
        algorithms: ["HS256"], 
      });
      return payload as { id: number };
    } catch (error: any) {
      throw new Error(`Invalid token: ${error.message}`);
    }
  },
};
