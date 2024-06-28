from flask import Flask, jsonify, render_template, request, url_for
import pyodbc
from templates import *

app = Flask(__name__)

# Configure your database connection
server = 'LAPTOP-PJ583R48'
database = 'Database_Web_Dev'
username = 'sa'
password = 'armani99'
driver= '{ODBC Driver 17 for SQL Server}'

# Establish the connection
conn = pyodbc.connect('DRIVER=' + driver + ';SERVER=' + server + ';PORT=1433;DATABASE=' + database + ';UID=' + username + ';PWD=' + password)
# conn = pyodbc.connect('DRIVER=' + driver + ';SERVER=' + server + ';PORT=1433;DATABASE=' + database )

def get_connection():
    connect =  pyodbc.connect('DRIVER=' + driver + ';SERVER=' + server + ';PORT=1433;DATABASE=' + database + ';UID=' + username + ';PWD=' + password)
    return connect

# Define a route for testing
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/books', methods=['GET'])
def get_books():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT id, title, author_id, publication_date, ISBN, summary FROM book')
    books = cursor.fetchall()
    books_list = []
    for book in books:
        books_list.append({
            'id': book.id,
            'title': book.title,
            'author_id': book.author_id,
            'publication_date': book.publication_date.strftime('%Y-%m-%d'),
            'ISBN': book.ISBN,
            'summary': book.summary
        })
    conn.close()
    return jsonify(books_list)

@app.route('/allbooks', methods=['GET'])
def book_list():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT id, title, author_id, publication_date, ISBN, summary FROM book')
    books = cursor.fetchall()
    books_list = []
    for book in books:
        books_list.append({
            'id': book.id,
            'title': book.title,
            'author_id': book.author_id,
            'publication_date': book.publication_date.strftime('%Y-%m-%d'),
            'ISBN': book.ISBN,
            'summary': book.summary
        })
    conn.close()
    return render_template('book_list.html', books_list=books_list)

@app.route('/bookreview')
def book_reviews():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT id, book_id, reviewer_name, rating, review_text FROM books_review')
    reviews = cursor.fetchall()
    reviews_list = []
    for review in reviews:
        reviews_list.append({
            'id': review[0],
            'book_id': review[1],
            'reviewer_name': review[2],
            'rating': review[3],
            'review_text': review[4]
        })
    conn.close()
    return render_template('reviews.html', reviews_list=reviews_list)

if __name__ == '__main__':
    app.run(debug=True)
