from flask import Flask, request
import sqlite3

app = Flask(__name__)

# SQL Injection
@app.route('/user')
def get_user():
    user_id = request.args.get('id')
    conn = sqlite3.connect('users.db')
    query = f"SELECT * FROM users WHERE id = {user_id}"
    cursor = conn.execute(query)
    return str(cursor.fetchone())

# #  XSSd
# @app.route('/hello')
# def hello():
#     me = request.args.get('me')
#     # Vulnerable: No output escaping
#     return f"<h1>Hello {me}</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)