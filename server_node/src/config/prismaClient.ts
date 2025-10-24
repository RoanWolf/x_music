import { PrismaClient } from "../../generated/prisma/client.ts";

interface GlobalWithPrisma {
  prisma?: PrismaClient;
}

const globalForPrisma = globalThis as GlobalWithPrisma;

export const prisma = globalForPrisma.prisma ?? new PrismaClient();

// 仅在非生产环境中缓存实例
if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prisma = prisma;
}


