import { prisma } from "../config/prismaClient.ts";
import { verifyPassword } from "../utils/pwHelper.ts";
export const userService = {
  async getAllUsers() {
    return await prisma.user.findMany();
  },

  async queryUserByEmail(email: string) {
    return await prisma.user.findUnique({
      where: { email },
    });
  },
  async createUser(data: { name: string; email: string; password: string }) {
    return await prisma.user.create({ data });
  },

  async validatePassword(email: string, password: string) {
    const user = await this.queryUserByEmail(email);

    if (!user) {
      return null;
    }

    const isValid = await verifyPassword(password, user.password);
    return isValid ? user : null;
  },

  async deleteUserById(id: number) {
    return await prisma.user.delete({
      where: { id },
    });
  },
};
