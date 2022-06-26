from flask import Flask, render_template, request
from connect_db import session, userpg

app = Flask(__name__)


@app.route("/")
def index():
    q = request.args.get('q')
    if q:
        results = session.query(userpg.user_login, userpg.Server, userpg.client, userpg.Date, userpg.Time).filter(
            userpg.user_login == q).order_by(userpg.Date.desc()).limit(10)
        return render_template("index.html", users=results)
    else:
        users = session.query(userpg.user_login, userpg.Server, userpg.client, userpg.Date, userpg.Time).order_by(
            userpg.Date.desc()).limit(20)
        return render_template("index.html", users=users)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5500, debug=True)


