import psycopg2

DATABASE_URL = "postgresql://postgres:0721@localhost:5432/x_music_test"
DATABASE_URL = "postgresql://postgres:0721@localhost:5432/x_music_db"
try:
    conn = psycopg2.connect(DATABASE_URL)
    print("✅ 数据库连接成功！")
    conn.close()
except Exception as e:
    print("❌ 连接失败：", e)
